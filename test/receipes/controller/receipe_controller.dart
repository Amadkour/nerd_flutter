import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:eighty_three_native_component/core/res/src/cubit/global_cubit.dart';
import 'package:eighty_three_native_component/core/res/src/errors/failures.dart';
import 'package:eighty_three_native_component/core/res/src/services/firebase/firebase_events_services.dart';
import 'package:eighty_three_native_component/core/res/src/services/local_storage_service.dart';
import 'package:eighty_three_native_component/core/utils/parsing/parent_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:res/modules/authentication/login/controllers/login_cubit.dart';
import 'package:res/modules/authentication/login/providers/repo/login_repo.dart';
import 'package:res/modules/authentication/registeration/module/registeration_type/controller/registration_type_cubit.dart';
import 'login_controller_test.mocks.dart';

@GenerateMocks(<Type>[LoginRepo, GlobalCubit, FirebaseEvents, LocalStorageService, RegistrationTypeCubit])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockLoginRepo repository;
  late MockFirebaseEvents firebaseEvents;
  late MockGlobalCubit globalCubit;
  late MockLocalStorageService mockLocalStorageService;
  late MockRegistrationTypeCubit mockRegistrationTypeCubit;

  final ApiFailure failure = ApiFailure(errors: <String, dynamic>{'error': "error occurred"});
  setUpAll(() {
    repository = MockLoginRepo();
    firebaseEvents = MockFirebaseEvents();
    globalCubit = MockGlobalCubit();
    mockRegistrationTypeCubit = MockRegistrationTypeCubit();
    mockLocalStorageService = MockLocalStorageService();
  });
  group('test login cubit', () {
    blocTest<LoginCubit, LoginState>(
      'Test login method in failure',
      build: () {
        when(mockLocalStorageService.getUserId).thenAnswer((Invocation realInvocation) async => "test");
        when(mockLocalStorageService.getUserLanguage).thenAnswer((Invocation realInvocation) => "test");
        when(repository.loginRepo(number: '1011223344', password: '112212', withPhone: false))
            .thenAnswer((Invocation realInvocation) async => Left<Failure, ParentModel>(failure));
        return LoginCubit(repository, firebaseEvents, mockLocalStorageService, mockRegistrationTypeCubit, globalCubit,
            localStorageService: mockLocalStorageService);
      },
      act: (LoginCubit bloc) {
        bloc.idController.text = "1011223344";
        bloc.password = "112212";
        return bloc.login();
      },
      expect: () => <TypeMatcher<LoginState>>[
        isA<LoginLoading>(),
        isA<LoginError>(),
      ],
    );

    blocTest<LoginCubit, LoginState>(
      'Test Login method',
      build: () {
        when(mockLocalStorageService.getUserId).thenAnswer((Invocation realInvocation) async => "test");
        when(repository.loginRepo(number: '1011223344', password: '112211', withPhone: false))
            .thenAnswer((Invocation realInvocation) async => Left<Failure, ParentModel>(failure));

        return LoginCubit(repository, firebaseEvents, mockLocalStorageService, mockRegistrationTypeCubit, globalCubit,
            localStorageService: mockLocalStorageService);
      },
      act: (LoginCubit bloc) {
        bloc.idController.text = "1011223344";
        bloc.password = "112212";
        return bloc.login();
      },
      expect: () => <TypeMatcher<LoginState>>[
        isA<LoginLoading>(),
        isA<LoginError>(),
      ],
    );
  });
}

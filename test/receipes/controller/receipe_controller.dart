import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nerd_flutter/features/receipe/controller/recipe_cubit.dart';
import 'package:nerd_flutter/features/receipe/controller/recipe_state.dart';
import 'package:nerd_flutter/features/receipe/model/entity_model/receipe_model.dart';
import 'package:nerd_flutter/features/receipe/model/repo/api_repo.dart';

import '../../core/api_connection_mocks.mocks.dart';
import '../repo/value.dart';

@GenerateMocks(<Type>[APIRepo])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockAPIRepo repository;

  setUpAll(() {
    repository = MockAPIRepo();
    when(repository.getRecipes()).thenAnswer(
        (Invocation realInvocation) async => recipeData.successfulResponse!
            .map((e) => RecipeModel.fromJson(e))
            .toList());
  });
  group('test login cubit', () {
    blocTest<RecipeCubit, RecipeState>(
      'Test login method in failure',
      build: () {
        return RecipeCubit(repo: repository);
      },
      act: (RecipeCubit bloc) {
        return bloc.init();
      },
      expect: () => <TypeMatcher<RecipeState>>[
        isA<RecipeStateLoading>(),
        isA<RecipeStateLoaded>(),
        isA<RecipeStateLoaded>(),
      ],
    );
  });
  group('favorite scenario', () {
    ///success scenario
    blocTest<RecipeCubit, RecipeState>(
      'success favorite',
      build: () {
        return RecipeCubit(repo: repository);
      },
      act: (RecipeCubit bloc) async {
        await bloc.init();
        return bloc.addItemToFavorite(0);
      },
      expect: () => <TypeMatcher<RecipeState>>[
        isA<RecipeStateLoading>(),
        isA<RecipeStateLoaded>(),
        isA<RecipeStateLoaded>(),
        isA<RecipeStateLoaded>(),
      ],
    );

    ///failed scenario
    blocTest<RecipeCubit, RecipeState>(
      'failed favorite',
      build: () {
        return RecipeCubit(repo: repository);
      },
      act: (RecipeCubit bloc) async {
        await bloc.init();
        return bloc.addItemToFavorite(1);
      },
      expect: () => <TypeMatcher<RecipeState>>[
        isA<RecipeStateLoading>(),
        isA<RecipeStateLoaded>(),
        isA<RecipeStateLoaded>(),
        isA<RecipeStateError>(),
      ],
    );
  });

  ///rate
  group('rate scenario', () {
    ///success scenario
    blocTest<RecipeCubit, RecipeState>(
      'success rate',
      build: () {
        return RecipeCubit(repo: repository);
      },
      act: (RecipeCubit bloc) async {
        await bloc.init();
        return bloc.addItemToRate(0);
      },
      expect: () => <TypeMatcher<RecipeState>>[
        isA<RecipeStateLoading>(),
        isA<RecipeStateLoaded>(),
        isA<RecipeStateLoaded>(),
        isA<RecipeStateLoaded>(),
      ],
    );

    ///failed scenario
    blocTest<RecipeCubit, RecipeState>(
      'failed rate',
      build: () {
        return RecipeCubit(repo: repository);
      },
      act: (RecipeCubit bloc) async {
        await bloc.init();
        return bloc.addItemToRate(1);
      },
      expect: () => <TypeMatcher<RecipeState>>[
        isA<RecipeStateLoading>(),
        isA<RecipeStateLoaded>(),
        isA<RecipeStateLoaded>(),
        isA<RecipeStateError>(),
      ],
    );
  });
}

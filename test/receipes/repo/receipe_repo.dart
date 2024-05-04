import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nerd_flutter/features/receipe/model/repo/api_repo.dart';

import '../../core/shared.mocks.dart';
import '../../core/utils.dart';
import 'value.dart';

void main() {
  late MockDio mockClass;
  late APIRepo provider;

  setUpAll(() async {
    mockClass = MockDio();
    provider = APIRepo(dio: mockClass);
  });
  group('login Scenarios', () {
    test('- success', () async {
      ///body
      when(
        mockClass.post(
          loginValues.path,
          data: compare(loginValues.successfulBody!),
        ),
      ).thenAnswer(
        (Invocation realInvocation) async => Response<Map<String, dynamic>>(
          statusCode: 200,
          data: loginValues.successfulResponse,
          requestOptions: RequestOptions(
            data: loginValues.successfulResponse,
            path: loginValues.path,
          ),
        ),
      );

      test('- failed', () async {
        expect(await provider.getReceipes(), isA<List>());
      });
    });
  });
}

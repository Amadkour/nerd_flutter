import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nerd_flutter/features/receipe/model/repo/api_repo.dart';

import '../../core/shared.mocks.dart';
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
        mockClass.get(
          recipeData.path,
        ),
      ).thenAnswer(
        (Invocation realInvocation) async =>
            Response<List<Map<String, dynamic>>>(
          statusCode: 200,
          data: recipeData.successfulResponse,
          requestOptions: RequestOptions(),
        ),
      );

      test('- fetch recipes', () async {
        expect(await provider.getRecipes(), isA<List>());
      });
    });
  });
}

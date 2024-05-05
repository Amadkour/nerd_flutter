import 'package:dio/dio.dart';
import 'package:nerd_flutter/features/receipe/model/entity_model/receipe_model.dart';

class APIRepo {
  static final APIRepo instance = APIRepo();
  late Dio _dio;
  APIRepo({Dio? dio}) {
    _dio = dio ?? Dio();
  }
  Future<List<RecipeModel>> getRecipes() async {
    Response<List<dynamic>> response =
        await _dio.get("https://api.npoint.io/43427003d33f1f6b51cc");
    List<dynamic> recipes = response.data as List<dynamic>;
    return recipes
        .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

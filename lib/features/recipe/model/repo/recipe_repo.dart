import 'package:dio/dio.dart';
import 'package:nerd_flutter/features/recipe/model/entity_model/receipe_model.dart';

class RecipeRepo {
  final Dio dio;
  RecipeRepo({required this.dio});

  Future<List<RecipeModel>> getRecipes() async {
    Response<List<dynamic>> response = await dio.get("https://api.npoint.io/43427003d33f1f6b51cc");
    List<dynamic> recipes = response.data as List<dynamic>;
    return recipes.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}

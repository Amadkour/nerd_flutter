import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/features/recipe/controller/recipe_state.dart';
import 'package:nerd_flutter/features/recipe/model/entity_model/receipe_model.dart';
import 'package:nerd_flutter/features/recipe/model/repo/favorite_repo.dart';
import 'package:nerd_flutter/features/recipe/model/repo/recipe_repo.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit({
    required this.recipeRepo,
    required this.favoriteRepo,
  }) : super(RecipeStateLoading()) {
    init();
  }
  final RecipeRepo recipeRepo;
  final FavoriteRepo favoriteRepo;

  List<RecipeModel> recipes = [];
  List<String> favoriteItems = [];

  Future<void> init() async {
    try {
      emit(RecipeStateLoading());

      recipes = await recipeRepo.getRecipes();
      favoriteItems = await favoriteRepo.getItems();

      ///prepare favorite saved items

      if (recipes.isEmpty) {
        emit(RecipeStateEmpty());
      } else {
        emit(RecipeStateLoaded());
      }
    } catch (e) {
      emit(RecipeStateError(error: e.toString()));
    }
  }

  void addItemToFavorite(int index) {
    try {
      recipes[index].toggelFavorite;
      emit(RecipeStateLoaded());
    } catch (e) {
      emit(RecipeStateError(error: e.toString()));
    }
  }

  void addItemToRate(int index) {
    try {
      recipes[index].toggelRate;
      emit(RecipeStateLoaded());
    } catch (e) {
      emit(RecipeStateError(error: e.toString()));
    }
  }
}

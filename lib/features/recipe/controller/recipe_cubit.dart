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
      if (recipes.isEmpty) {
        emit(RecipeStateEmpty());
      } else {
        ///prepare favorite saved items
        prepareFavorite();
        emit(RecipeStateLoaded());
      }
    } catch (e) {
      emit(RecipeStateError(error: e.toString()));
    }
  }

  Future<void> addItemToFavorite(int index) async {
    try {
      recipes[index].toggelFavorite;
      if (!recipes[index].isFavorite) {
        await favoriteRepo.deleteItem(id: recipes[index].id ?? '');
      }
      emit(RecipeStateLoaded());
    } catch (e) {
      emit(RecipeStateError(error: e.toString()));
    }
  }

  Future<void> addItemToFavoriteDatabase(int index) async {
    try {
      recipes[index].toggelFavorite;
      if (recipes[index].isFavorite) {
        await favoriteRepo.insertItem(id: recipes[index].id ?? '');
      }
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

  prepareFavorite() {
    for (int i = 0; i < recipes.length; i++) {
      if (favoriteItems.contains(recipes[i].id ?? '')) {
        recipes[i].toggelFavorite;
      }
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/features/receipe/controller/recipe_state.dart';
import 'package:nerd_flutter/features/receipe/model/entity_model/receipe_model.dart';
import 'package:nerd_flutter/features/receipe/model/repo/api_repo.dart';

class RecipeCubit extends Cubit<RecipeState> {
  static RecipeCubit instance = RecipeCubit();

  RecipeCubit({APIRepo? repo}) : super(RecipeStateLoading()) {
    _repo = repo ?? APIRepo.instance;
    init();
  }

  List<RecipeModel> recipes = [];

  late APIRepo _repo;

  Future<void> init() async {
    try {
      emit(RecipeStateLoading());
      recipes = await _repo.getRecipes();
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
      print(recipes.length.toString());
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

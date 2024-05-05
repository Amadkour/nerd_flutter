import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/core/configration/di.dart';
import 'package:nerd_flutter/features/profile/controller/profile_state.dart';
import 'package:nerd_flutter/features/recipe/controller/recipe_cubit.dart';
import 'package:nerd_flutter/features/recipe/model/entity_model/receipe_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit instance = ProfileCubit();

  ProfileCubit() : super(ProfileStateLoaded());

  void addItemToFavorite(RecipeModel model) {
    final int index = ioc<RecipeCubit>().recipes.indexWhere((element) => element.id == model.id);
    ioc<RecipeCubit>().addItemToFavorite(index);
    emit(ProfileStateLoaded());
  }

  Future<void> addItemToFavoriteDatabase(RecipeModel model) async {
    final int index = ioc<RecipeCubit>().recipes.indexWhere((element) => element.id == model.id);
    await ioc<RecipeCubit>().addItemToFavoriteDatabase(index);
    emit(ProfileStateLoaded());
  }

  void addItemToRate(RecipeModel model) {
    final int index = ioc<RecipeCubit>().recipes.indexWhere((element) => element.id == model.id);
    ioc<RecipeCubit>().addItemToRate(index);

    emit(ProfileStateLoaded());
  }
}

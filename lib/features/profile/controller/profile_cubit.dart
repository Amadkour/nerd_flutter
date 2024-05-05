import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/features/profile/controller/profile_state.dart';
import 'package:nerd_flutter/features/receipe/controller/recipe_cubit.dart';
import 'package:nerd_flutter/features/receipe/model/entity_model/receipe_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit instance = ProfileCubit();

  ProfileCubit() : super(ProfileStateLoaded());

  void addItemToFavorite(RecipeModel model) {
    log(RecipeCubit.instance.recipes.length.toString());

    final int index = RecipeCubit.instance.recipes
        .indexWhere((element) => element.id == model.id);
    RecipeCubit.instance.addItemToFavorite(index);
    emit(ProfileStateLoaded());
  }

  void addItemToRate(RecipeModel model) {
    log(RecipeCubit.instance.recipes.length.toString());
    final int index = RecipeCubit.instance.recipes
        .indexWhere((element) => element.id == model.id);
    RecipeCubit.instance.addItemToRate(index);

    emit(ProfileStateLoaded());
  }
}

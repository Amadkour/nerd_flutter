import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/features/profile/controller/profile_state.dart';
import 'package:nerd_flutter/features/receipe/controller/reciepe_cubit.dart';
import 'package:nerd_flutter/features/receipe/model/entity_model/receipe_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit instance = ProfileCubit();

  ProfileCubit() : super(ProfileStateLoaded());

  List<ReceipeModel> receipes = [];

  void addItemToFavorite(ReceipeModel model) {
    final int index = ReciepeCubit.instance.receipes.indexWhere((element) => element.id == model.id);
    receipes[index].toggelFavorite;
    ReciepeCubit.instance.addItemToFavorite(index);
    emit(ProfileStateLoaded());
  }

  void addItemToRate(ReceipeModel model) {
    log(ReciepeCubit.instance.receipes.length.toString());
    final int index = ReciepeCubit.instance.receipes.indexWhere((element) => element.id == model.id);
    receipes[index].toggelRate;
    ReciepeCubit.instance.addItemToRate(index);

    emit(ProfileStateLoaded());
  }
}
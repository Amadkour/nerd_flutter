import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/features/receipe/controller/receipe_state.dart';
import 'package:nerd_flutter/features/receipe/model/entity_model/receipe_model.dart';
import 'package:nerd_flutter/features/receipe/model/repo/api_repo.dart';

class ReciepeCubit extends Cubit<ReceipeState> {
  static ReciepeCubit instance = ReciepeCubit();

  ReciepeCubit({APIRepo? repo}) : super(ReceipeStateLoading()) {
    init();
  }

  List<ReceipeModel> receipes = [];

  late APIRepo _repo;

  Future<void> init() async {
    try {
      emit(ReceipeStateLoading());
      receipes = await _repo.getRecipes();
      if (receipes.isEmpty) {
        emit(ReceipeStateEmpty());
      } else {
        emit(ReceipeStateLoaded());
      }
    } catch (e) {
      emit(ReceipeStateError(error: e.toString()));
    }
  }

  void addItemToFavorite(int index) {
    try {
      receipes[index].toggelFavorite;
      emit(ReceipeStateLoaded());
    } catch (e) {
      emit(ReceipeStateError(error: e.toString()));
    }
  }

  void addItemToRate(int index) {
    try {
      receipes[index].toggelRate;
      emit(ReceipeStateLoaded());
    } catch (e) {
      emit(ReceipeStateError(error: e.toString()));
    }
  }
}

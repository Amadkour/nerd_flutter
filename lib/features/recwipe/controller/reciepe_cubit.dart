import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/features/recwipe/controller/receipe_state.dart';
import 'package:nerd_flutter/features/recwipe/model/entity_model/receipe_model.dart';
import 'package:nerd_flutter/features/recwipe/model/repo/api_repo.dart';

class ReciepeCubit extends Cubit<ReceipeState> {
  static ReciepeCubit instance = ReciepeCubit();

  ReciepeCubit() : super(ReceipeStateLoading()) {
    init();
  }

  List<ReceipeModel> receipes = [];

  APIRepo repo = APIRepo();

  Future<void> init() async {
    emit(ReceipeStateLoading());
    // await repo.initDB();

    receipes = await repo.getReceipes();
    if (receipes.isEmpty) {
      emit(ReceipeStateEmpty());
    } else {
      emit(ReceipeStateLoaded());
    }
  }

  void addItemToFavorite(int index) {
    receipes[index].toggelFavorite;
    emit(ReceipeStateLoaded());
  }

  void addItemToRate(int index) {
    receipes[index].toggelRate;
    emit(ReceipeStateLoaded());
  }
}

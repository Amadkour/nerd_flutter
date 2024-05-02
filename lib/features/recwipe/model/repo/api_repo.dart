import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nerd_flutter/features/recwipe/model/entity_model/receipe_model.dart';

class APIRepo {
  Future<List<ReceipeModel>> getReceipes() async {
    Response<List<dynamic>> response = await Dio().get("https://api.npoint.io/43427003d33f1f6b51cc");
    log(response.data.toString());

    List<dynamic> receipes = response.data as List<dynamic>;
    return receipes.map((e) => ReceipeModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}

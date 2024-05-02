import 'package:dio/dio.dart';

class ReceipeRepo {
  Future<void> getReceipes() async {
    await Dio().get('https://api.npoint.io/43427003d33f1f6b51cc');
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<RegistrationState> {
  LoginCubit() : super(RegistrationInitial());

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        'recipe',
      );
    } else {
      log('invalid inputs');
    }
  }
}

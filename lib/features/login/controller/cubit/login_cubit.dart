import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<RegistrationState> {
  LoginCubit() : super(RegistrationInitial());

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ///correct credintionals
  final String correctMail = 'nerd@nerd.com';
  final String correctPassword = 'Nerd@123';
  bool onPressedConfirmButton() {
    if (formKey.currentState!.validate() &&
        correctMail == mailController.text &&
        correctPassword == passwordController.text) {
      return true;
    } else {
      return false;
    }
  }
}

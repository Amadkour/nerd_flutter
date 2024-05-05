import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/core/utils/text_decoration.dart';
import 'package:nerd_flutter/core/utils/validation.dart';
import 'package:nerd_flutter/features/login/controller/cubit/login_cubit.dart';

class RequiredDataWidget extends StatelessWidget {
  RequiredDataWidget({super.key, required this.controller});

  final LoginCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<LoginCubit, RegistrationState>(
        builder: (context, state) {
          LoginCubit controller = context.read<LoginCubit>();

          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                ///logo
                const Text(
                  "Login in NERD",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),

                ///mail
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.mailController,
                    keyboardType: TextInputType.name,
                    validator: MyValidation.instance.mainValidate,
                    decoration: decoration.copyWith(
                        labelText: 'mail', hintText: 'xxxx@gmail.com', prefixIcon: const Icon(Icons.mail)),
                  ),
                ),

                ///password

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.passwordController,
                    keyboardType: TextInputType.text,
                    validator: MyValidation.instance.passValidate,
                    decoration: decoration.copyWith(
                      labelText: 'password',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    obscureText: true,
                    obscuringCharacter: "*",
                  ),
                ),
                const Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}

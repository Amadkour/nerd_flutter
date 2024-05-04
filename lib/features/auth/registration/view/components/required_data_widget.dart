import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/core/utils/context_extension.dart';
import 'package:nerd_flutter/core/utils/text_decoration.dart';
import 'package:nerd_flutter/core/utils/validation.dart';
import 'package:nerd_flutter/features/auth/registration/controller/cubit/login_cubit.dart';

class RequiredDataWidget extends StatelessWidget {
  RequiredDataWidget({super.key, required this.controller});

  final RegistrationCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          RegistrationCubit controller = context.read<RegistrationCubit>();

          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///logo
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        "https://www.shutterstock.com/image-vector/vector-islam-kuran-ramadan-islamic-600w-1492032890.jpg",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    SizedBox(
                      width: context.width / 4,
                    ),
                    const Text(
                      "Login Up in NERD",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                ///mail
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.mailController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation.instance.nameValidate,
                  decoration: decoration.copyWith(
                      labelText: 'mail', hintText: 'xxxx@gmail.com', prefixIcon: const Icon(Icons.mail)),
                ),

                ///password

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation.instance.nameValidate,
                  decoration: decoration.copyWith(
                    labelText: 'password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                  obscuringCharacter: "*",
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

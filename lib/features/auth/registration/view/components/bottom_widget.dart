import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/core/utils/context_extension.dart';
import 'package:nerd_flutter/features/auth/registration/controller/cubit/login_cubit.dart';

class BottomNavigationWiget extends StatelessWidget {
  BottomNavigationWiget({super.key, required this.controller});

  final RegistrationCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          RegistrationCubit controller = context.read<RegistrationCubit>();

          return Column(
            children: [
              SizedBox(
                height: context.height / 20,
              ),
              FilledButton(
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                  onPressed: () async {
                    log('added successfully');
                    // controller.onPressedConfirmButton(context);
                    // await controller.addUser();
                  },
                  child: const Text("Confirm")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("have an account ? "),
                  InkWell(
                    onTap: () async {
                      // print(await (await DatabaseUserRepo.instance).fetch());
                      // (await DatabaseUserRepo.instance).insert(name: 'name', address: 'address');
                    },
                    child: const Text(
                      "login",
                      style: TextStyle(
                          color: Colors.orange,
                          decorationStyle: TextDecorationStyle.solid,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 3),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

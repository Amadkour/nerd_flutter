import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/core/utils/context_extension.dart';
import 'package:nerd_flutter/features/login/controller/cubit/login_cubit.dart';

class BottomNavigationWiget extends StatelessWidget {
  BottomNavigationWiget({super.key, required this.controller});

  final LoginCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<LoginCubit, RegistrationState>(
        builder: (context, state) {
          LoginCubit controller = context.read<LoginCubit>();

          return Column(
            children: [
              SizedBox(
                height: context.height / 20,
              ),
              Container(
                width: context.width - 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                    onTap: () async {
                      controller.onPressedConfirmButton(context);
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}

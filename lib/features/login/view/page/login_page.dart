import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/core/utils/context_extension.dart';
import 'package:nerd_flutter/features/login/controller/cubit/login_cubit.dart';
import 'package:nerd_flutter/features/login/view/components/bottom_widget.dart';
import 'package:nerd_flutter/features/login/view/components/required_data_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, RegistrationState>(
          builder: (context, state) {
            final LoginCubit controller = context.read<LoginCubit>();
            return Scaffold(
              appBar: AppBar(),
              body: RequiredDataWidget(
                controller: controller,
              ),
              bottomNavigationBar: SizedBox(
                height: context.height / 4,
                child: BottomNavigationWiget(
                  controller: controller,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

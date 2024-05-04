import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/core/utils/context_extension.dart';
import 'package:nerd_flutter/features/auth/registration/controller/cubit/login_cubit.dart';
import 'package:nerd_flutter/features/auth/registration/view/components/bottom_widget.dart';
import 'package:nerd_flutter/features/auth/registration/view/components/required_data_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<RegistrationCubit>(
        create: (context) => RegistrationCubit(),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            final RegistrationCubit controller = context.read<RegistrationCubit>();
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

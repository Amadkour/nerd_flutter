import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/features/receipe/controller/receipe_state.dart';
import 'package:nerd_flutter/features/receipe/controller/reciepe_cubit.dart';
import 'package:nerd_flutter/features/receipe/view/component/product_item_widget.dart';

class ReceipePage extends StatelessWidget {
  const ReceipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ReciepeCubit.instance,
      child: BlocBuilder<ReciepeCubit, ReceipeState>(
        builder: (context, state) {
          final ReciepeCubit controller = context.read<ReciepeCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Receipes'),
            ),
            body: state is ReceipeStateLoading
                ? const Center(child: CircularProgressIndicator())
                : state is ReceipeStateEmpty
                    ? const Center(
                        child: Icon(
                          CupertinoIcons.delete,
                          size: 100,
                          color: Colors.blue,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (_, int index) => InkWell(
                          child: ReceipeItemWidget(
                            model: controller.receipes[index],
                            toggelFavorite: () => controller.addItemToFavorite(index),
                            toggelRate: () => controller.addItemToRate(index),
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, 'profile', arguments: ReciepeCubit.instance.receipes[index]),
                        ),
                        itemCount: controller.receipes.length,
                      ),
          );
        },
      ),
    );
  }
}

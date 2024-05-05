import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/features/receipe/controller/recipe_cubit.dart';
import 'package:nerd_flutter/features/receipe/controller/recipe_state.dart';
import 'package:nerd_flutter/features/receipe/view/component/product_item_widget.dart';

class ReceipePage extends StatelessWidget {
  const ReceipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: RecipeCubit.instance,
      child: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          final RecipeCubit controller = context.read<RecipeCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Receipes'),
            ),
            body: state is RecipeStateError
                ? Center(child: Text(state.error))
                : state is RecipeStateLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state is RecipeStateEmpty
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
                                model: controller.recipes[index],
                                toggelFavorite: () =>
                                    controller.addItemToFavorite(index),
                                toggelRate: () =>
                                    controller.addItemToRate(index),
                              ),
                              onTap: () => Navigator.pushNamed(
                                  context, 'profile',
                                  arguments:
                                      RecipeCubit.instance.recipes[index]),
                            ),
                            itemCount: controller.recipes.length,
                          ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/core/configration/di.dart';
import 'package:nerd_flutter/features/recipe/controller/recipe_cubit.dart';
import 'package:nerd_flutter/features/recipe/controller/recipe_state.dart';
import 'package:nerd_flutter/features/recipe/view/component/product_item_widget.dart';

class ReceipePage extends StatelessWidget {
  const ReceipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ioc<RecipeCubit>(),
      child: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          final RecipeCubit controller = context.read<RecipeCubit>();
          return Scaffold(
            appBar: AppBar(
              title: const Text('Recipes'),
            ),
            body: SafeArea(
              child: state is RecipeStateError
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
                                  toggelFavorite: () => controller.addItemToFavorite(index),
                                  toggelRate: () => controller.addItemToRate(index),
                                ),
                                onTap: () =>
                                    Navigator.pushNamed(context, 'profile', arguments: controller.recipes[index]),
                              ),
                              itemCount: controller.recipes.length,
                            ),
            ),
          );
        },
      ),
    );
  }
}

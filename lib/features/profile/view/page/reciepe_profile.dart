import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_flutter/core/utils/context_extension.dart';
import 'package:nerd_flutter/features/profile/controller/profile_cubit.dart';
import 'package:nerd_flutter/features/profile/controller/profile_state.dart';
import 'package:nerd_flutter/features/profile/view/component/iterms_list_widget.dart';
import 'package:nerd_flutter/features/profile/view/component/title_and_value_widget.dart';
import 'package:nerd_flutter/features/receipe/model/entity_model/receipe_model.dart';
import 'package:nerd_flutter/features/receipe/view/component/like_action.dart';
import 'package:nerd_flutter/features/receipe/view/component/rate_action.dart';

class ReciepePage extends StatelessWidget {
  const ReciepePage({super.key, required this.model});
  final RecipeModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name ?? 'Receipe Profile'),
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocProvider(
              create: (context) => ProfileCubit(),
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  final ProfileCubit controller = context.read<ProfileCubit>();
                  return Stack(
                    children: [
                      Image.network(
                        model.image ?? '',
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        width: context.width,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              RateAction(
                                isRate: model.isRate,
                                ratings: (model.ratings ?? 0).toString(),
                                toggelRate: () =>
                                    controller.addItemToRate(model),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              LikeAction(
                                isFavorite: model.isFavorite,
                                favorite: (model.favorites ?? 0).toString(),
                                toggelFavorite: () =>
                                    controller.addItemToFavorite(model),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            ///description

            ItemTitleAndDescriptionWidget(
                title: 'description', value: model.description ?? ''),
            ItemTitleAndDescriptionWidget(
                title: 'calories', value: model.calories ?? ''),
            if ((model.deliverableIngredients ?? []).isNotEmpty)
              ItemsListWidget(
                title: 'deliverable Ingredients',
                items: model.deliverableIngredients ?? [],
              ),
            if ((model.products ?? []).isNotEmpty)
              ItemsListWidget(
                title: 'products',
                items: model.products ?? [],
              ),
            if ((model.keywords ?? []).isNotEmpty)
              ItemsListWidget(
                title: 'keywords',
                items: model.keywords ?? [],
              ),
          ],
        ),
      ),
    );
  }
}

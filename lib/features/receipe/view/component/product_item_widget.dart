import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nerd_flutter/features/receipe/model/entity_model/receipe_model.dart';
import 'package:nerd_flutter/features/receipe/view/component/like_action.dart';
import 'package:nerd_flutter/features/receipe/view/component/rate_action.dart';

class ReceipeItemWidget extends StatelessWidget {
  const ReceipeItemWidget({
    super.key,
    required this.model,
    this.toggelFavorite,
    this.toggelRate,
  });
  final RecipeModel model;
  final void Function()? toggelFavorite;
  final void Function()? toggelRate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ///product info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      model.image ?? '',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                model.name ?? 'product',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.clock,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  (model.weeks?.first ?? '').toString(),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    // color: Colors.blue,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          model.description ?? 'description',
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
              ),

              ///actions

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ///rate
                  RateAction(
                    isRate: model.isRate,
                    ratings: (model.ratings ?? 0).toString(),
                    toggelRate: toggelRate,
                  ),

                  ///divider
                  Container(
                    width: 0.5,
                    height: 30,
                    color: Colors.grey,
                  ),

                  ///like
                  LikeAction(
                    isFavorite: model.isFavorite,
                    favorite: (model.favorites ?? 0).toString(),
                    toggelFavorite: toggelFavorite,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nerd_flutter/core/overlay/overlay.dart';
import 'package:nerd_flutter/features/recipe/view/component/confirm_save_favorite_widget.dart';

class LikeAction extends StatelessWidget {
  const LikeAction({
    super.key,
    required this.toggelFavorite,
    required this.isFavorite,
    required this.favorite,
    required this.onConfirmSaveToDatabase,
  });
  final void Function() toggelFavorite;
  final Future<void> Function() onConfirmSaveToDatabase;
  final bool isFavorite;
  final String favorite;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              if (!isFavorite) {
                MyOverlay.instance.showMyDialog(
                    context,
                    ConfirmFavorite(
                      onCancel: () {
                        toggelFavorite();
                        Navigator.pop(context);
                      },
                      onConfirm: () async {
                        onConfirmSaveToDatabase();
                        Navigator.pop(context);
                      },
                    ));
              } else {
                toggelFavorite();
              }
            },
            child: isFavorite
                ? const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.red,
                  )
                : const Icon(
                    CupertinoIcons.heart,
                    color: Colors.grey,
                  )),
        const SizedBox(
          width: 5,
        ),
        Text('$favorite likes'),
      ],
    );
  }
}

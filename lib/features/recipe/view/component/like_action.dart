import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeAction extends StatelessWidget {
  const LikeAction({
    super.key,
    this.toggelFavorite,
    required this.isFavorite,
    required this.favorite,
  });
  final void Function()? toggelFavorite;
  final bool isFavorite;
  final String favorite;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: toggelFavorite,
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

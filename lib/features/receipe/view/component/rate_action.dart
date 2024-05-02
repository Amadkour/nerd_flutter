import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RateAction extends StatelessWidget {
  const RateAction({
    super.key,
    this.toggelRate,
    required this.isRate,
    required this.ratings,
  });
  final void Function()? toggelRate;
  final bool isRate;
  final String ratings;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: toggelRate,
            child: isRate
                ? const Icon(
                    CupertinoIcons.star_fill,
                    color: Colors.yellow,
                  )
                : const Icon(
                    CupertinoIcons.star,
                    color: Colors.grey,
                  )),
        const SizedBox(
          width: 5,
        ),
        Text('${ratings} rate'),
      ],
    );
  }
}

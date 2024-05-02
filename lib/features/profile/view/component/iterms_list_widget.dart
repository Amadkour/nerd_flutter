import 'package:flutter/material.dart';

class ItemsListWidget extends StatelessWidget {
  const ItemsListWidget({super.key, required this.title, required this.items});
  final String title;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.blue, fontSize: 18),
          ),
          ...List.generate(
              items.length,
              (index) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        margin: EdgeInsets.only(left: 20, right: 5, top: 5),
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                      ),
                      Text(items[index])
                    ],
                  )),
        ],
      ),
    );
  }
}

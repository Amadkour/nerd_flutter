import 'package:flutter/material.dart';
import 'package:nerd_flutter/core/extensions/context_extension.dart';
import 'package:nerd_flutter/features/recwipe/model/entity_model/receipe_model.dart';

class ReciepePage extends StatelessWidget {
  const ReciepePage({super.key, required this.model});
  final ReceipeModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name ?? 'Receipe Profile'),
      ),
      body: Column(
        children: [
          Image.network(
            model.image ?? '',
            width: context.width,
          )
        ],
      ),
    );
  }
}

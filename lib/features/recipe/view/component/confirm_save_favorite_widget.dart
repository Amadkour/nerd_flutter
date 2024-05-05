import 'package:flutter/material.dart';

class ConfirmFavorite extends StatelessWidget {
  const ConfirmFavorite({
    super.key,
    required this.onConfirm,
    required this.onCancel,
  });
  final Future<void> Function() onConfirm;
  final void Function() onCancel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Do you need to save this item permanently or just this once?',
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FilledButton(
                onPressed: () async {
                  await onConfirm();
                },
                child: const Text("Permanently"),
              ),
              FilledButton(
                onPressed: () {
                  onCancel();
                },
                child: const Text("Once"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

InputDecoration decoration = InputDecoration(
  errorMaxLines: 2,
  border: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 2), borderRadius: BorderRadius.circular(30)),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.blue, width: 2),
    borderRadius: BorderRadius.circular(5),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red, width: 2),
    borderRadius: BorderRadius.circular(30),
  ),
);

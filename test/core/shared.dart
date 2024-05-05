import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:nerd_flutter/features/receipe/controller/recipe_cubit.dart';

@GenerateMocks(<Type>[
  Dio,
  RecipeCubit,
])
void main() {}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nerd_flutter/core/configration/local_database.dart';
import 'package:nerd_flutter/features/login/controller/cubit/login_cubit.dart';
import 'package:nerd_flutter/features/profile/controller/profile_cubit.dart';
import 'package:nerd_flutter/features/recipe/controller/recipe_cubit.dart';
import 'package:nerd_flutter/features/recipe/model/repo/favorite_repo.dart';
import 'package:nerd_flutter/features/recipe/model/repo/recipe_repo.dart';

final ioc = GetIt.instance;

void setup() {
  ///api provider
  ioc.registerSingleton<Dio>(Dio());

  ///database provider
  ioc.registerSingleton<MyDatabase>(MyDatabase());

  ///recipe
  ioc.registerLazySingleton<RecipeCubit>(() => RecipeCubit(recipeRepo: ioc(), favoriteRepo: ioc()));
  ioc.registerSingleton<RecipeRepo>(RecipeRepo(dio: ioc()));
  ioc.registerLazySingleton<FavoriteRepo>(() => FavoriteRepo(db: ioc()));

  ///profile
  ioc.registerLazySingleton<ProfileCubit>(() => ProfileCubit());

  ///login
  ioc.registerLazySingleton<LoginCubit>(() => LoginCubit());
}

import 'package:flutter/material.dart';
import 'package:nerd_flutter/features/login/view/page/login_page.dart';
import 'package:nerd_flutter/features/profile/view/page/reciepe_profile.dart';
import 'package:nerd_flutter/features/recipe/model/entity_model/receipe_model.dart';
import 'package:nerd_flutter/features/recipe/view/page/recipe_page.dart';

class MyRoute {
  Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'receipe':
        return MaterialPageRoute(builder: (_) => const ReceipePage());
      case 'login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case 'profile':
        final RecipeModel model = settings.arguments as RecipeModel;
        return MaterialPageRoute(
            builder: (_) => ReciepePage(
                  model: model,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const ReceipePage());
    }
  }
}

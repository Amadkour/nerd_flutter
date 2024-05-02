import 'package:flutter/material.dart';
import 'package:nerd_flutter/features/profile/view/page/reciepe_profile.dart';
import 'package:nerd_flutter/features/receipe/model/entity_model/receipe_model.dart';
import 'package:nerd_flutter/features/receipe/view/page/product_page.dart';

class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const ReceipePage()),
  ];

  static Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'receipe':
        return MaterialPageRoute(builder: (_) => const ReceipePage());
      case 'profile':
        final ReceipeModel model = settings.arguments as ReceipeModel;
        return MaterialPageRoute(
            builder: (_) => ReciepePage(
                  model: model,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const ReceipePage());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:nerd_flutter/features/recwipe/view/page/product_page.dart';

class MyRoute {
  static List<Route<dynamic>> initialRoutes = [
    MaterialPageRoute(builder: (_) => const ReceipePage()),
  ];

  static Route<dynamic> onNavigateByName(RouteSettings settings) {
    switch (settings.name) {
      case 'receipe':
        return MaterialPageRoute(builder: (_) => const ReceipePage());
      case 'receipe':
        return MaterialPageRoute(builder: (_) => const ReceipePage());
      default:
        return MaterialPageRoute(builder: (_) => const ReceipePage());
    }
  }
}

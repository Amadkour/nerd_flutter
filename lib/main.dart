import 'package:flutter/material.dart';
import 'package:nerd_flutter/core/routing/my_route.dart';

void main() {
  MaterialApp materialApp = const MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: MyRoute.onNavigateByName,
    initialRoute: 'login',
  );
  runApp(materialApp);
}

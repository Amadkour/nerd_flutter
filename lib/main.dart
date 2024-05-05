import 'package:flutter/material.dart';
import 'package:nerd_flutter/core/configration/di.dart';
import 'package:nerd_flutter/core/routing/my_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  MaterialApp materialApp = MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: ioc<MyRoute>().onNavigateByName,
    initialRoute: 'recipe',
  );
  runApp(materialApp);
}

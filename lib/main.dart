import 'package:flutter/material.dart';
import 'package:nerd_flutter/core/configration/di.dart';
import 'package:nerd_flutter/core/routing/my_route.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  MaterialApp materialApp = const MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: MyRoute.onNavigateByName,
    initialRoute: 'login',
  );
  runApp(materialApp);
}

import 'package:flutter/material.dart';
import 'package:nerd_flutter/core/routing/my_route.dart';

void main() {
  MaterialApp materialApp = MaterialApp(
    onGenerateRoute: MyRoute.onNavigateByName,
    initialRoute: 'reciepe',
  );
  runApp(materialApp);
}

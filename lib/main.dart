import 'package:flutter/material.dart';
import 'package:shopping_app/routes.dart';
import 'package:shopping_app/ui/screens/checkout_screen.dart';
import 'package:shopping_app/ui/screens/home_screen.dart';
import 'package:shopping_app/ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.theme,
      onGenerateRoute: MyRoutes.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}

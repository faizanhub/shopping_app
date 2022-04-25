import 'package:flutter/material.dart';
import 'package:shopping_app/ui/screens/checkout_screen.dart';
import 'package:shopping_app/ui/screens/home_screen.dart';

abstract class MyRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case CheckoutScreen.routeName:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());

      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}

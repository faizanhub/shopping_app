import 'package:flutter/material.dart';
import 'package:shopping_app/core/models/products.dart';
import 'package:shopping_app/ui/screens/checkout_screen.dart';
import 'package:shopping_app/ui/screens/home_screen.dart';

abstract class MyRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case CheckoutScreen.routeName:
        final args = settings.arguments as List;
        return MaterialPageRoute(
            builder: (_) => CheckoutScreen(
                  selectedItemsList: args[0],
                  removeFromCart: args[1],
                  resetCart: args[2],
                ));

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}

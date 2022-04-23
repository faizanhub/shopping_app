import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppStrings.appTitle}'),
        centerTitle: true,

        ///appbar with cart icon
      ),
      body: Column(
        children: [
          /// Category  Tile
          ///
          /// Products ListView
          /// Bill Tile
        ],
      ),
    );
  }
}

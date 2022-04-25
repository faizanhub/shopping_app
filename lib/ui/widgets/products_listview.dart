import 'package:flutter/material.dart';
import 'package:shopping_app/ui/widgets/products_tile.dart';

class ProductsListView extends StatelessWidget {
  bool removeIcon;

  ProductsListView({this.removeIcon = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ProductsTile(
            removeIcon: removeIcon,
          );
        },
      ),
    );
  }
}

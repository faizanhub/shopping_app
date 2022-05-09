import 'package:flutter/material.dart';
import 'package:shopping_app/core/models/products.dart';

class ProductsTile extends StatelessWidget {
  final bool removeIcon;
  final Product product;
  final void Function()? onTrailingPress;

  ProductsTile({
    this.removeIcon = false,
    required this.product,
    required this.onTrailingPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Image.network(
          '${product.image}',
          fit: BoxFit.fill,
          width: 80,
          height: 70,
        ),
        horizontalTitleGap: 35,
        title: Text(
          '${product.title}',
          textAlign: TextAlign.start,
        ),
        subtitle: Text(
          '${product.category}',
        ),
        trailing: IconButton(
          onPressed: onTrailingPress,
          icon: removeIcon
              ? Icon(Icons.remove_shopping_cart_outlined)
              : Icon(Icons.add_shopping_cart_outlined),
        ),
      ),
    );
  }
}

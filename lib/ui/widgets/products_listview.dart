import 'package:flutter/material.dart';
import 'package:shopping_app/core/models/products.dart';
import 'package:shopping_app/ui/widgets/no_item_tile.dart';
import 'package:shopping_app/ui/widgets/products_tile.dart';

class ProductsListView extends StatefulWidget {
  bool removeIcon;
  List<Product> listOfProducts;
  void Function(Product)? addToCart;
  void Function(int)? removeFromCart;

  ProductsListView({
    this.removeIcon = false,
    required this.listOfProducts,
    this.addToCart,
    this.removeFromCart,
  });

  @override
  State<ProductsListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<ProductsListView> {
  @override
  Widget build(BuildContext context) {
    List<Product> myListOfProducts = widget.listOfProducts;

    return myListOfProducts.isNotEmpty
        ? Expanded(
            child: ListView.builder(
              itemCount: widget.listOfProducts.length,
              itemBuilder: (context, index) {
                return ProductsTile(
                  onTrailingPress: () {
                    if (widget.addToCart != null) {
                      widget.addToCart!(widget.listOfProducts[index]);
                    } else if (widget.removeFromCart != null) {
                      widget.removeFromCart!(widget.listOfProducts[index].id!);
                    }
                  },
                  removeIcon: widget.removeIcon,
                  product: widget.listOfProducts[index],
                );
              },
            ),
          )
        : const Expanded(child: NoItemTile());
  }
}

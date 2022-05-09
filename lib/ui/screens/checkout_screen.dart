import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/core/models/products.dart';
import 'package:shopping_app/ui/widgets/bill_tile.dart';
import 'package:shopping_app/ui/widgets/products_listview.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routeName = '/checkoutScreen';

  List<Product> selectedItemsList;
  void Function(int) removeFromCart;
  void Function() resetCart;

  CheckoutScreen(
      {required this.selectedItemsList,
      required this.removeFromCart,
      required this.resetCart});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.checkout),
      ),
      body: Column(
        children: [
          ///Bill Tile
          BillTile(),

          ///Cart Products ListView
          ProductsListView(
            removeIcon: true,
            listOfProducts: widget.selectedItemsList,
            removeFromCart: (id) {
              setState(() {
                widget.removeFromCart(id);
              });
            },
          ),

          SizedBox(height: 10),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).appBarTheme.backgroundColor),
                minimumSize: MaterialStateProperty.all(Size(40, 40)),
              ),
              onPressed: () {},
              child: Text('Checkout'),
            ),
          ),

          ///Checkout Button
        ],
      ),
    );
  }
}

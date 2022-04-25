import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/ui/widgets/bill_tile.dart';
import 'package:shopping_app/ui/widgets/products_listview.dart';

class CheckoutScreen extends StatefulWidget {
  static const String routeName = '/checkoutScreen';

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
          ),

          SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).appBarTheme.backgroundColor),
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

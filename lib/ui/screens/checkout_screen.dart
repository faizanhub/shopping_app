import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/core/models/products.dart';
import 'package:shopping_app/core/utils/alert_dialog.dart';
import 'package:shopping_app/ui/screens/home_screen.dart';
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
  double totalBill = 0.0;

  handleCheckoutButton() {
    showAlertDialog(
      context,
      'Checkout',
      'Thank you for Shopping',
      onPressOk: () {
        widget.resetCart();
        Navigator.pushNamed(context, HomeScreen.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.checkout),
      ),
      body: Column(
        children: [
          ///Bill Tile
          BillTile(
            selectedProducts: widget.selectedItemsList,
          ),

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

          const SizedBox(height: 10),

          ///Checkout Button
          widget.selectedItemsList.isNotEmpty
              ? SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).appBarTheme.backgroundColor),
                      minimumSize:
                          MaterialStateProperty.all(const Size(40, 40)),
                    ),
                    onPressed: handleCheckoutButton,
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

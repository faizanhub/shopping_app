import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/ui/screens/checkout_screen.dart';
import 'package:shopping_app/ui/widgets/bill_tile.dart';
import 'package:shopping_app/ui/widgets/category_tile.dart';
import 'package:shopping_app/ui/widgets/products_listview.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String categoryValue = AppStrings.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppStrings.appTitle}'),
        centerTitle: true,

        ///appbar with cart icon
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CheckoutScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          /// Category  Tile
          CategoryTile(
            selectedCategory: categoryValue,
            onChanged: (newValue) {
              setState(() {
                categoryValue = newValue!;
              });
            },
          ),

          /// Products ListView
          ProductsListView(),

          /// Bill Tile
          BillTile(),
        ],
      ),
    );
  }
}

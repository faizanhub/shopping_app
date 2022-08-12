import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/core/models/products.dart';
import 'package:shopping_app/core/services/shopping_services.dart';
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
  final ShoppingServices _shoppingServices = ShoppingServices();

  List<Product>? listOfAllProducts;
  List<String> listOfAllCategories = [];
  List<Product> selectedItemsList = [];

  double totalBill = 0.0;

  String category = '';

  // int cart = 0;

  @override
  void initState() {
    super.initState();
    fetchProducts(category);
    getAllCategories();
  }

  fetchProducts(String category) {
    _shoppingServices.fetchProducts(category).then((listOfProduct) {
      setState(() {
        listOfAllProducts = listOfProduct;
      });
    });
  }

  getAllCategories() {
    _shoppingServices.getAllCategories().then((listOfCategories) {
      setState(() {
        listOfAllCategories = listOfCategories;
      });
    });
  }

  addToCart(Product product) {
    setState(() {
      selectedItemsList.add(product);
    });
  }

  removeFromCart(int id) {
    setState(() {
      selectedItemsList.removeWhere((element) => element.id == id);
    });
  }

  resetCart() {
    setState(() {
      selectedItemsList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appTitle),
        centerTitle: true,
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 2, end: 2),
            badgeContent: Text('${selectedItemsList.length}'),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CheckoutScreen.routeName,
                    arguments: [selectedItemsList, removeFromCart, resetCart]);
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          )
        ],

        ///appbar with cart icon
      ),
      body: Column(
        children: [
          /// Category  Tile
          CategoryTile(
            selectedCategory: categoryValue,
            listOfCategories: listOfAllCategories,
            onChanged: (newValue) {
              setState(() {
                categoryValue = newValue!;

                listOfAllProducts = null;
                fetchProducts(categoryValue);
              });
            },
          ),

          /// Products ListView

          listOfAllProducts != null
              ? ProductsListView(
                  listOfProducts: listOfAllProducts!,
                  addToCart: addToCart,
                )
              : const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),

          /// Bill Tile
          BillTile(
            selectedProducts: selectedItemsList,
          ),
        ],
      ),
    );
  }
}

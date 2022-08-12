import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/constants/text_styles.dart';
import 'package:shopping_app/core/models/products.dart';

class BillTile extends StatelessWidget {
  double totalBill = 0;
  final List<Product> selectedProducts;

  BillTile({required this.selectedProducts});

  @override
  Widget build(BuildContext context) {
    if (selectedProducts.isNotEmpty) {
      for (var value in selectedProducts) {
        totalBill += value.price!;
      }
    }

    return Container(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: const Text(
          AppStrings.totalBill,
          style: categoryTextStyle,
        ),
        title: Text(
          totalBill.toString(),
          style: categoryTextStyle,
        ),
      ),
    );
  }
}

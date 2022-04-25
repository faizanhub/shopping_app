import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/constants/text_styles.dart';

class BillTile extends StatelessWidget {
  final double totalBill;

  BillTile({this.totalBill = 235.23});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: Text(
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

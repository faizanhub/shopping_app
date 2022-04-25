import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/constants/text_styles.dart';

class CategoryTile extends StatelessWidget {
  final Function(String?)? onChanged;
  final String selectedCategory;

  CategoryTile({
    required this.onChanged,
    this.selectedCategory = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: Text(
          AppStrings.categories,
          style: categoryTextStyle,
        ),
        title: DropdownButton<String>(
          value: selectedCategory,
          // icon: const Icon(Icons.arrow_downward),
          // elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: onChanged,
          items: <String>['All', 'One', 'Two', 'Free', 'Four']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          isExpanded: true,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/constants/text_styles.dart';

class CategoryTile extends StatelessWidget {
  final Function(String?)? onChanged;
  final String selectedCategory;
  final List<String> listOfCategories;

  CategoryTile({
    required this.onChanged,
    this.selectedCategory = '',
    required this.listOfCategories,
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
          items: [
            DropdownMenuItem(
              child: Text(AppStrings.all),
              value: AppStrings.all,
            ),
            ...listOfCategories
                .map(
                  (category) => DropdownMenuItem<String>(
                    child: Text(category),
                    value: category,
                  ),
                )
                .toList()
          ],
          isExpanded: true,
        ),
      ),
    );
  }
}

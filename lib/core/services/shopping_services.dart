import 'package:flutter/cupertino.dart';
import 'package:shopping_app/constants/app_strings.dart';
import 'package:shopping_app/constants/configs.dart';
import 'package:shopping_app/constants/error_strings.dart';
import 'package:shopping_app/core/models/products.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class ShoppingServices {
  Future<List<Product>> fetchProducts(String category) async {
    List<Product> listOfProducts = [];

    String url = category.isEmpty || category == AppStrings.all
        ? '${AppConfigs.baseUrl}${AppConfigs.allProductsEndPoint}'
        : '${AppConfigs.baseUrl}${AppConfigs.singleCategory}$category';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      for (var val in jsonResponse) {
        listOfProducts.add(Product.fromJson(val));
      }

      return listOfProducts;
    } else {
      throw Exception('${ErrorStrings.requestError} ${response.statusCode}');
    }
  }

  Future<List<String>> getAllCategories() async {
    List<String> listOfCategories = [];

    Uri url =
        Uri.parse('${AppConfigs.baseUrl}${AppConfigs.allCategoriesEndPoint}');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      for (var val in jsonResponse) {
        listOfCategories.add(val);
      }

      return listOfCategories;
    } else {
      throw Exception('${ErrorStrings.requestError} ${response.statusCode}');
    }
  }
}

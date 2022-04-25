import 'package:flutter/material.dart';

class ProductsTile extends StatelessWidget {
  bool removeIcon;

  ProductsTile({this.removeIcon = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FlutterLogo(size: 40),
      horizontalTitleGap: 35,
      title: Text(
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. , ',
        textAlign: TextAlign.start,
      ),
      subtitle: Text(
        'Lorem Ipasdfasdfasdfasdfuse',
      ),
      trailing: Icon(
        removeIcon
            ? Icons.remove_shopping_cart_outlined
            : Icons.add_shopping_cart_outlined,
      ),
    );
  }
}

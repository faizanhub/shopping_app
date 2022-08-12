import 'package:flutter/material.dart';
import 'package:shopping_app/constants/text_styles.dart';

class NoItemTile extends StatelessWidget {
  const NoItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .30,
        child: const Text('No Products Selected', style: categoryTextStyle),
      ),
    );
  }
}

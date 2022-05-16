import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String title, desc,
    {required Function() onPressOk}) {
  showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(desc),
          ),
          actions: [
            TextButton(onPressed: onPressOk, child: Text('Ok')),
          ],
        );
      });
}

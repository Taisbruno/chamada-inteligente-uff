import 'package:flutter/material.dart';

void showToast(BuildContext context, String title, String buttonText) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(title),
      action: SnackBarAction(
          label: buttonText, onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}

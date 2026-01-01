import 'package:flutter/material.dart';

class SnackbarHelper {
  static void snackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), backgroundColor: color));
  }
}

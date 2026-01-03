import 'package:flutter/material.dart';

class SnackbarHelper {
static void show(BuildContext context, {String? message, required Color backgroundColor}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(message ?? "Something went wrong"), 
      backgroundColor: backgroundColor
    ));
}

}

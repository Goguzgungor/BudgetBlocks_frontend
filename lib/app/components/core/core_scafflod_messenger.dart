import 'package:flutter/material.dart';

showCoreSnackBarr(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
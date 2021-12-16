import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showInSnackBar(BuildContext context, String errorText) {
  final snackBar = SnackBar(
    content: Text(
      errorText,
      style: const TextStyle(fontSize: 15, fontFamily: "Segoe"),
    ),
   // backgroundColor: ColorResources.PrimaryColor,
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
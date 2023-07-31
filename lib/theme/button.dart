import 'package:dcy_wallet/theme/typography.dart';
import 'package:flutter/material.dart';

var buttonTheme = ElevatedButtonThemeData(
  style: ButtonStyle(
    padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 16, horizontal: 12)),
    elevation: MaterialStateProperty.all<double>(0),
    foregroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
    backgroundColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
    shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
    ),
    textStyle: MaterialStatePropertyAll(textTheme.labelLarge),
    fixedSize: const MaterialStatePropertyAll<Size>(
      Size(500, 48),
    ),
  ),
);

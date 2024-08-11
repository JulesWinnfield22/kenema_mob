import 'package:flutter/material.dart';
import 'package:insurance_app/app_export.dart';

class COutlinedButtonTheme {
  COutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      side: BorderSide(
        color: CColors.textPrimary,
      ),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      textStyle: TextStyle(
        fontSize: 12,
        color: CColors.textLabel.withOpacity(0.4),
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: CColors.textPrimary,
        ),
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
    ),
  );
}

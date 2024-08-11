import 'package:insurance_app/app_export.dart';
import 'package:flutter/material.dart';

class CCheckboxTheme {
  CCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return CColors.primary;
        }
      },
    ),
    fillColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return CColors.primary;
        } else {
          return Colors.transparent;
        }
      },
    ),
    overlayColor: MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.selected)) {
          return CColors.primary;
        } else {
          return CColors.primary;
        }
      },
    ),
    side: BorderSide(
      color: Colors.grey.shade300,
      width: 1,
    ),
  );
}

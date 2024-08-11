import 'package:insurance_app/app_export.dart';
import 'package:flutter/material.dart';

class CRadioButtonTheme {
  CRadioButtonTheme._();

  static RadioThemeData  lightRadiobuttonTheme = RadioThemeData(

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

  );
}

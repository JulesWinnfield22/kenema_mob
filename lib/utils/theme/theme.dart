import 'package:insurance_app/core/utils/theme/custom_theme/appbar_theme.dart';
import 'package:insurance_app/core/utils/theme/custom_theme/checkbox_theme.dart';
import 'package:insurance_app/core/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:insurance_app/core/utils/theme/custom_theme/outline_button_theme.dart';
import 'package:insurance_app/core/utils/theme/custom_theme/radio_button_theme.dart';
import 'package:insurance_app/core/utils/theme/custom_theme/text_field_theme.dart';
import 'package:insurance_app/core/utils/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // fontFamily: GoogleFonts.dmSans().fontFamily,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    appBarTheme: CAppBarTheme.lighAppBarTheme,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CTextTheme.lightTextTheme,
    checkboxTheme: CCheckboxTheme.lightCheckboxTheme,
    radioTheme: CRadioButtonTheme.lightRadiobuttonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.lightInputDecorationTheme,
  );
}

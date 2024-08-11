import 'package:insurance_app/app_export.dart';

class CElevatedButtonTheme {
  CElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: CColors.primary,
      disabledForegroundColor: Colors.grey.shade200,
      disabledBackgroundColor: CColors.secondary,
      // side: const BorderSide(color: Colors.blue),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      textStyle: const TextStyle(
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.w300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}

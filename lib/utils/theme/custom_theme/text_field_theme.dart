import 'package:insurance_app/app_export.dart';

class CTextFormFieldTheme {
  CTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    errorMaxLines: 3,
    prefixIconColor: Colors.grey.shade800,
    suffixIconColor: Colors.grey.shade800,
    labelStyle: const TextStyle().copyWith(
      fontSize: 12,
      color: CColors.darkGrey,
      fontWeight: FontWeight.w400,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: CColors.textLabel.withOpacity(0.3),
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: CColors.black,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),

    border: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: CColors.textPrimary),
      borderRadius: BorderRadius.circular(5.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: CColors.textPrimary),
      borderRadius: BorderRadius.circular(5.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: CColors.textPrimary),
      borderRadius: BorderRadius.circular(5.0),
    ),

    // border: const OutlineInputBorder().copyWith(
    //     borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
    // enabledBorder: const OutlineInputBorder().copyWith(
    //     borderSide: BorderSide(width: 1, color: Colors.grey.shade300)),
    // focusedBorder: const OutlineInputBorder().copyWith(
    //     borderSide: const BorderSide(width: 1, color: CColors.primary)),
    errorBorder: const OutlineInputBorder()
        .copyWith(borderSide: const BorderSide(width: 1, color: CColors.error)),
    focusedErrorBorder: const OutlineInputBorder()
        .copyWith(borderSide: const BorderSide(width: 1, color: CColors.error)),
  );
}

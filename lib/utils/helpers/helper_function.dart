import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CHelperFunction {
  static void navigateToScreen(BuildContext context, Widget screen,
      {bool pushReplacement = false}) {
    if (pushReplacement) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => screen,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => screen,
        ),
      );
    }
  }

  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }

  static void navigateSlideToScreen(
    BuildContext context,
    Widget screen,
  ) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<T> mergeLists<T>(List<List<T>> lists) {
    return lists.expand((list) => list).toList();
  }

  static String toCurrency(num number) {
    NumberFormat currencyFormat =
        NumberFormat.currency(decimalDigits: 2, customPattern: '#,##0.00');

    return currencyFormat.format(number);
  }
}

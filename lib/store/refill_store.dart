import 'package:flutter/material.dart';
import 'package:kenema/features/equbs/api/prescription_api.dart';
import 'package:kenema/features/equbs/api/refill_api.dart';

// ignore: camel_case_types
class RefillStore extends ChangeNotifier {
  Refill? refill;

  void fromJson(Map<String, dynamic> json) {
    refill = Refill.fromJson(json);
    notifyListeners();
  }

  void changePrescription(Refill r) {
    refill = r;
    notifyListeners();
  }
}

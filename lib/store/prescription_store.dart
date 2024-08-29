import 'package:flutter/material.dart';
import 'package:kenema/features/equbs/api/prescription_api.dart';

// ignore: camel_case_types
class prescriptionStore extends ChangeNotifier {
  PrescriptionHistory? prescriptions;

  void fromJson(Map<String, dynamic> json) {
    prescriptions = PrescriptionHistory.fromJson(json);
    notifyListeners();
  }

  void changePrescription(PrescriptionHistory p) {
    prescriptions = p;
    notifyListeners();
  }
}

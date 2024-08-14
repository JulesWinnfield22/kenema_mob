import 'package:flutter/material.dart';
import 'package:kenema/enums.dart';
import 'package:kenema/features/equbs/api/equb_api.dart';

// class Patient {
//   String title;
//   String firstName;
//   String fatherName;
//   String grandFatherName;
//   String gender;
//   String email;
//   String mobilePhone;
//   String insuredStatus;
//   String institutionName;

//   Patient({
//     required this.title,
//     required this.firstName,
//     required this.fatherName,
//     required this.grandFatherName,
//     required this.gender,
//     required this.email,
//     required this.mobilePhone,
//     required this.institutionName,
//     required this.insuredStatus,
//   });

//   factory Patient.fromJson(Map<String, dynamic> json) {
//    return Patient(title: json['title'], firstName: json['firstName'], fatherName: json['fatherName'], grandFatherName: json['grandFatherName'], gender: json['gender'], email: json['email'], mobilePhone: json['mobilePhone'], institutionName: json['institutionName'], insuredStatus: json['insuredStatus']);
//   }
// }

class PatientStore extends ChangeNotifier {
  Patient? patient;

  void fromJson(Map<String, dynamic> json) {
    patient = Patient.fromJson(json);
    notifyListeners();
  }

  void changePatient(Patient p) {
    patient = p;
    notifyListeners();
  }
}

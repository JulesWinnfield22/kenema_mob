import 'package:flutter/material.dart';
import 'package:kenema/enums.dart';

class Patient {
  String title;
  String firstName;
  String fatherName;
  String grandFatherName;
  String gender;
  String email;
  String mobilePhone;
  String insuredStatus;
  String institutionName;

  Patient({
    required this.title,
    required this.firstName,
    required this.fatherName,
    required this.grandFatherName,
    required this.gender,
    required this.email,
    required this.mobilePhone,
    required this.institutionName,
    required this.insuredStatus,
  });
}

class PatientStore extends ChangeNotifier {
  Patient patient = Patient(
    title: "Mr.",
    email: 'abelteame22@gmail.com',
    firstName: "Abel",
    fatherName: "Teame",
    grandFatherName: "Gebre",
    gender: Gender.male,
    mobilePhone: "0912121212",
    institutionName: "Medco",
    insuredStatus: Status.active
  ); 

  void changePatient(Patient p) {
    patient = p;
    notifyListeners();
  }
}
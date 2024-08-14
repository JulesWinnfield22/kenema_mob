import 'dart:convert';

import '../../../service/api_service.dart';

class Patient {
  String? userUuid;
  String? firstName;
  String? mobilePhone;

  Patient({
    this.userUuid,
    this.firstName,
    this.mobilePhone,
  });
  Map<String, dynamic> toJson() {
    return {
      'userUuid': userUuid,
      'firstName': firstName,
      'mobilePhone': mobilePhone,
      // Add other properties to the map
    };
  }

  factory Patient.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {"userUuid": String userUuid, "firstName": String firstName} =>
        Patient(userUuid: userUuid, firstName: firstName),
      _ => Patient(userUuid: 'userUuid', firstName: "firstName")
    };
  }

  factory Patient.fromJsonArray(List<dynamic> json) {
    var first = json[0];
    return Patient(
      firstName: first['firstName'],
      mobilePhone: first['mobilePhone'],
      userUuid: first['userUuid'],
    );
  }
}

var api = ApiService();

Future<ResponseHandler<Patient>> getPatient(String text) async {
  var res = await api.get("/kenema/patients/getPatients?search=$text");
  if (res.success) {
    var equb = Patient.fromJsonArray(jsonDecode(res.data as String));
    return ResponseHandler(
        success: res.success, data: equb, error: res.error, status: res.status);
  }

  return ResponseHandler(
      success: res.success,
      data: Patient(),
      error: res.error,
      status: res.status);
}

//void main() {
//  print(getEqub());
//}

import 'dart:convert';
import 'package:kenema/features/equbs/api/prescription_api.dart';

import '../../../service/api_service.dart';

class Refill {
  List<DrugPrescription>? drugPrescription;

  Refill({this.drugPrescription});

  factory Refill.fromJson(Map<String, dynamic> json) {
    return Refill(
      drugPrescription: (json['drugPrescriptions'] as List<dynamic>)
          .map((v) => DrugPrescription.fromJson(v))
          .toList(),
    );
  }
}

var api = ApiService();

Future<ResponseHandler<Refill>> getRefill(String id) async {
  var res = await api.get("/kenema/refill/getByUuid/$id");
  if (res.success) {
    print(res.data.runtimeType);
    var decodedJson = jsonDecode(res.data as String);
    var patientResponse = Refill.fromJson(decodedJson);
    return ResponseHandler(
      success: res.success,
      data: patientResponse,
      error: res.error,
      status: res.status,
    );
  }

  return ResponseHandler(
    success: res.success,
    data: Refill(),
    error: res.error,
    status: res.status,
  );
}

import 'dart:convert';
import '../../../service/api_service.dart';

class Vitals {
  String? temperature;
  String? bloodPressure;
  String? bloodGlucoseLevel;
  String? height;
  String? weight;
  String? pulseRate;
  String? allergies;
  String? adherence;
  String? immunization;
  String? bmi;

  Vitals({
    this.temperature,
    this.bloodPressure,
    this.bloodGlucoseLevel,
    this.height,
    this.weight,
    this.pulseRate,
    this.allergies,
    this.adherence,
    this.immunization,
    this.bmi,
  });

  factory Vitals.fromJson(Map<String, dynamic> json) {
    return Vitals(
      temperature: json['temperature'],
      bloodPressure: json['bloodPressure'],
      bloodGlucoseLevel: json['bloodGlucoseLevel'],
      height: json['height'],
      weight: json['weight'],
      pulseRate: json['pulseRate'],
      allergies: json['allergies'],
      adherence: json['adherence'],
      immunization: json['immunization'],
      bmi: json['bmi'],
    );
  }
}

class Physician {
  String? physicianFirstName;
  String? physicianLastName;
  String? physicianHospital;
  String? physicianPhoneNumber;

  Physician(
      {this.physicianFirstName,
      this.physicianHospital,
      this.physicianLastName,
      this.physicianPhoneNumber});

  factory Physician.fromJson(Map<String, dynamic> json) {
    return Physician(
      physicianFirstName: json['physicianFirstName'],
      physicianHospital: json['physicianHospital'],
      physicianLastName: json['physicianLastName'],
      physicianPhoneNumber: json['physicianPhoneNumber'],
    );
  }
}

class Visit {
  String? encounterNumber;
  String? visitDate;

  Visit({this.encounterNumber, this.visitDate});

  factory Visit.fromJson(Map<String, dynamic> json) {
    return Visit(
      encounterNumber: json['encounterNumber'],
      visitDate: json['visitDate'],
    );
  }
}

class DrugPrescription {
  String? productName;
  String? productId;
  String? route;
  String? unit;
  // Frequency? frequency;
  int? duration;
  int? totalQuantity;
  String? instruction;
  String? diagnosisDetail;
  String? chiefComplaint;
  // ignore: non_constant_identifier_names
  int? list_price;
  String? dose;
  String? drugCode;
  String? dosageForm;
  String? drugStrength;
  String? indications;
  String? cautions;
  String? drugInteraction;
  String? contraindication;
  String? sideEffect;

  DrugPrescription(
      {this.productName,
      this.productId,
      this.route,
      this.unit,
      // this.frequency,
      this.duration,
      this.totalQuantity,
      this.instruction,
      this.diagnosisDetail,
      this.chiefComplaint,
      // ignore: non_constant_identifier_names
      this.list_price,
      this.dose,
      this.drugCode,
      this.dosageForm,
      this.drugStrength,
      this.indications,
      this.cautions,
      this.drugInteraction,
      this.contraindication,
      this.sideEffect});

  factory DrugPrescription.fromJson(Map<String, dynamic> json) {
    return DrugPrescription(
      productName: json['product_name'],
      productId: json['product_id'].toString(),
      route: json['route'],
      unit: json['unit'],
      duration: json['duration'],
      totalQuantity: json['totalQuantity'],
      instruction: json['instruction'],
      diagnosisDetail: json['diagnosisDetail'],
      chiefComplaint: json['chiefComplaint'],
    );
  }

  static List<DrugPrescription> fromArrayJson(List<dynamic> json) {
    return json.map((drug) {
      return DrugPrescription.fromJson(drug);
    }).toList();
  }
}

class Patients {
  List<Vitals>? vitals;

  List<Visit>? visits;
  Patients({this.visits, this.vitals});

  factory Patients.fromJson(Map<String, dynamic> json) {
    return Patients(
      vitals: (json['vitals'] as List<dynamic>)
          .map((v) => Vitals.fromJson(v))
          .toList(),
      visits: (json['visits'] as List<dynamic>)
          .map((v) => Visit.fromJson(v))
          .toList(),
    );
  }
}

class Prescriptions {
  String? prescriptionUuid;
  int? totalPrice;
  List<Visit>? visits;
  List<Patients>? patients;
  List<DrugPrescription>? drugPrescriptions;
  List<Vitals>? vitals;

  Prescriptions(
      {this.prescriptionUuid,
      this.totalPrice,
      this.visits,
      this.patients,
      this.drugPrescriptions,
      this.vitals});

  factory Prescriptions.fromJson(Map<String, dynamic> json) {
    return Prescriptions(
      prescriptionUuid: json['prescriptionUuid'],
      totalPrice: json['totalPrice'],
      vitals: (json['vitals'] as List<dynamic>)
          .map((v) => Vitals.fromJson(jsonDecode(v)))
          .toList(),
      drugPrescriptions: (json['drugPrescriptions'] as List<dynamic>)
          .map((v) => DrugPrescription.fromJson(jsonDecode(v)))
          .toList(),
      visits: (json['visits'] as List<dynamic>)
          .map((v) => Visit.fromJson(jsonDecode(v)))
          .toList(),
    );
  }

  // @override
  // String toString() {
  //   return 'Prescriptions(prescriptionUuid: $prescriptionUuid, totalPrice: $totalPrice)';
  // }
}

class PrescriptionHistory {
  String? institutionName;
  String? firstName;
  String? gender;
  List<Prescriptions>? prescriptions;

  PrescriptionHistory({
    this.institutionName,
    this.firstName,
    this.gender,
    this.prescriptions,
  });

  factory PrescriptionHistory.fromJson(Map<String, dynamic> json) {
    List<dynamic> ary = json["prescriptions"] ?? [];
    List<Prescriptions> pres = ary.map((pre) {
      return Prescriptions(
        prescriptionUuid: pre['prescriptionUuid'],
      );
    }).toList();
    // List<dynamic> prescriptions = jsonDecode(json['prescriptions']);
    return PrescriptionHistory(
        firstName: json['firstName'],
        gender: json['gender'],
        institutionName: json['institutionName'],
        // drugPrescription: (json['drugPrescriptions'] as List<dynamic>)
        //     .map((v) => DrugPrescription.fromJson(v))
        //     .toList(),
        prescriptions: pres);
  }
  @override
  String toString() {
    return 'PrescriptionHistory(firstName: $firstName, gender: $gender, institutionName: $institutionName, prescriptions: $prescriptions)';
  }
}

var api = ApiService();

Future<ResponseHandler<PrescriptionHistory>> getPrescription(String id) async {
  var res = await api.get("/kenema/patients/patientHistory/$id");
  print("\n\n\n\n ressss ${res.data} \n\n\n\n");
  if (res.success) {
    print('ggggg');
    print(res.data.runtimeType);
    var decodedJson = jsonDecode(res.data as String);
    print("habe");
    var patientResponse = PrescriptionHistory.fromJson(decodedJson);
    print("lll");
    print("vhgv ${patientResponse.prescriptions}");
    return ResponseHandler(
      success: res.success,
      data: patientResponse,
      error: res.error,
      status: res.status,
    );
  }

  return ResponseHandler(
    success: res.success,
    data: PrescriptionHistory(),
    error: res.error,
    status: res.status,
  );
}

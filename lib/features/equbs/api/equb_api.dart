import 'dart:convert';

import '../../../service/api_service.dart';

class Equb {
  String? name;
  String? id;

  Equb({
    this.name,
    this.id,
  });

  
  factory Equb.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {"name": String name, "id": String id} => Equb(name: name, id: id),
      _ => Equb(name: 'name', id: "id")
    };
  }
}

var api = ApiService();

Future<ResponseHandler<Equb>> getEqub() async {
  var res = await api.get("/equbs");
  if(res.success) {
    var equb = Equb.fromJson(jsonDecode(res.data as String));
    return ResponseHandler(success: res.success, data: equb, error: res.error, status: res.status);
  }
  
  return ResponseHandler(success: res.success, data: Equb(), error: res.error, status: res.status);
}


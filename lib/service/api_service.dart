import 'package:http/http.dart' as http;

class ResponseHandler<T> {
  int status;
  T? data;
  bool success = false;
  String error;

  ResponseHandler({required this.status, this.data, required this.success, required this.error});
}

ResponseHandler<String> handler(http.Response response) {
  if (response.statusCode >= 200 && response.statusCode < 300) {
    return ResponseHandler<String>(
        data: response.body,
        success: true,
        error: "",
        status: response.statusCode);
  }

  return ResponseHandler<String>(
      success: false, data: "", error: response.body, status: response.statusCode);
}

class ApiService {
  String baseUrl = "http://192.168.100.25:4000/api";

  ApiService({baseUrl});

  Future<ResponseHandler> get(String url,
      {Map<String, String>? headers = const {}}) async {
    var res = await http.get(Uri.parse("$baseUrl$url"), headers: headers);
    return handler(res);
  }
}
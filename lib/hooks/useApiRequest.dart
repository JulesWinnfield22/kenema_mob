import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kenema/service/api_service.dart';

typedef F = Future<ResponseHandler<T>> Function<T>(Future<ResponseHandler<T>>);

class ApiRequest<T> {
  final ValueNotifier<bool> pending;
  final ValueNotifier<String> error;
  ValueNotifier<T?>? response;
  final F send;

  ApiRequest(
      {required this.error,
      this.response,
      required this.pending,
      required this.send});
}

ValueNotifier<ApiRequest> useApiRequest<D>([D? initData]) {
  final pending = useState<bool>(false);
  final error = useState<String>("");
  final response = useState<D?>(initData);

  Future<ResponseHandler<T>> send<T>(Future<ResponseHandler<T>> a) async {
    pending.value = true;
    error.value = "";
    try {
      var res = await a;
      if (res.success) {
        response.value = res.data as D;
      } else {
        error.value = res.error;
      }
      pending.value = false;
      return res;
    } catch (err) {
      pending.value = false;
      error.value = err.toString();
      return ResponseHandler(
          error: err.toString(), success: false, status: 404);
    }
  }

  final api = useState<ApiRequest>(ApiRequest<D>(
      error: error, response: response, pending: pending, send: send));
  return api;
}

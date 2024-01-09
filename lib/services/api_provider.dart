import 'package:demo_apis_flutter/services/custom_interceptor.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  static Dio? _dio;
  static ApiProvider? _instance;

  ApiProvider._() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.interceptors.add(CustomInterceptor());
    }
  }
  static ApiProvider instance() {
    _instance ??= ApiProvider._();
    return _instance!;
  }

  Dio get dio => _dio!;

  // methods
  Future<Response> request({
    Map<String, dynamic>? data,
    required String method,
    required String path,
  }) async {
    Response response;
    try{
      switch(method.toUpperCase()){
        case "GET":
          response = await _dio!.get(path);
          break;
        case "POST":
          response = await _dio!.post(path,data: data);
          break;
        default:
          throw Exception("UnSupported http method : $method");
      }
      return response;
    }catch(e){
      rethrow;
    }
  }
}

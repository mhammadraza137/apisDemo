import 'dart:developer';

import 'package:demo_apis_flutter/models/user_model.dart';
import 'package:demo_apis_flutter/services/api_provider.dart';
import 'package:dio/dio.dart';

class UserMethods {
  static UserMethods? _instance;
  ApiProvider apiProvider = ApiProvider.instance();

  UserMethods._();

  static UserMethods instance() {
    _instance ??= UserMethods._();
    return _instance!;
  }

  Future<dynamic> getUsers({String? userId}) async {
    String baseUrl = userId == null
        ? "https://jsonplaceholder.typicode.com/users"
        : "https://jsonplaceholder.typicode.com/users/$userId";
    late Response response;
    try {
      response =
          await apiProvider.request(method: 'GET', path: baseUrl);
      if (response.statusCode == 200) {
      } else {
        log('Operation is not successful : ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred : $e');
    }
    return response.data;
  }
}

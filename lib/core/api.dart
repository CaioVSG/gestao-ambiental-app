import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final _dio = Dio();
  static const String baseUrl = 'http://77.243.85.238:8003/api';

  Future login(String email, String password) async {
    var response = await _dio.post(baseUrl + '/users/auth',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
        data: {'email': email, 'password': password});
    print(response.data);
  }
}

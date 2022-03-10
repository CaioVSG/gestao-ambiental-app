import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/user_model.dart';
import 'package:provider/provider.dart';

class Api {
  final _dio = Dio();
  static const String baseUrl = 'http://77.243.85.238:8003/api';
  Future login(BuildContext context, String email, String password) async {
    final UserModel userModel = Provider.of<UserModel>(context, listen: false);
    try {
      var response = await _dio.post('http://77.243.85.238:8003/api/users/auth',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
          data: {
            'email': email,
            'password': password,
            'device_name': 'mobile',
          });
      if (response.statusCode == 200) {
        userModel.setUserRefreshToken(response.data);
        print(userModel.refreshToken);
        return true;
      }
    } catch (e) {
      return false;
    }

    // if (response.statusCode == 200) {
    //   print(response.data);
    //   // UserModel(refreshToken: response.data);
    //   return true;
    // } else {
    //   return false;
    // }
  }
}

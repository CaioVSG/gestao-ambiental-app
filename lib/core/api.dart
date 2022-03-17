import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:provider/provider.dart';

class Api {
  final _dio = Dio();
  static const String baseUrl = 'http://77.243.85.238:8003/api';

  Future login(BuildContext context, String email, String password) async {
    final UserModel userModel = Provider.of<UserModel>(context, listen: false);
    try {
      var response = await _dio.post(baseUrl + '/users/auth',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
          data: {
            'email': 'analista@analista.com',
            'password': '12345678',
            'device_name': 'mobile',
          });
      if (response.statusCode == 200) {
        userModel.setUserRefreshToken(response.data);
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  //Requisita todos os dados de visitas
  Future getAllVisits(BuildContext context) async {
    final userModel = Provider.of<UserModel>(context);
    try {
      var response = await _dio.get(
        baseUrl + '/visitas',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${userModel.refreshToken}',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return (response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}

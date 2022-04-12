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
        userModel.setUser(
            response.data['id'],
            response.data['token'],
            response.data['name'],
            response.data['email'],
            response.data['profile_photo_url']);
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  //Requisita todos os dados de visitas
  Future getAllVisits(BuildContext context) async {
    try {
      var response = await _dio.get(
        baseUrl + '/visitas',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${Provider.of<UserModel>(context, listen: false).token}',
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
      return null;
    }
  }

  //requisita a finalização da visita
  Future finishVisit(BuildContext context, int id) async {
    try {
      Response response = await _dio.post(baseUrl + '/visitas/$id/concluir',
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${Provider.of<UserModel>(context, listen: false).token}',
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

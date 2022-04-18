// import 'dart:html';

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:meioambientemobile/core/util/download_controller.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
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

  Future getAllVisitsDocuments(
      {required int companyId,
      required int requirementId,
      required BuildContext context}) async {
    try {
      var response = await _dio.get(
        baseUrl + '/empresas/$companyId/requerimento/$requirementId/documentos',
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

  Future downloadSpecifiedDocument({
    required int companyId,
    required int requirementId,
    required int documentId,
    required BuildContext context,
  }) async {
    try {
      var dir = await getExternalStorageDirectory();
      String fullPath = dir!.path + '/' + documentId.toString() + '.pdf';
      var response = await _dio.download(
        baseUrl +
            '/empresas/$companyId/requerimento/$requirementId/documentos/$documentId/arquivo',
        fullPath,
        onReceiveProgress: (count, total) {
          Provider.of<DownloaderController>(context, listen: false)
              .showDownloadProgress(count, total);
        },
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },
          headers: {
            'Authorization':
                'Bearer ${Provider.of<UserModel>(context, listen: false).token}',
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        File documentFile = File(fullPath);
        if (documentFile.existsSync()) {
          debugPrint('exists');
          OpenFile.open(fullPath);
        }
        var raf = documentFile.openSync(mode: FileMode.write);
        raf.writeFromSync(response.data);

        raf.close();
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

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:meioambientemobile/core/util/download_controller.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/style/constants.dart';

class Api {
  final _dio = Dio();
  // static const String kBaseUrl = 'http://185.28.23.76:8080/api';
  //!!test

  Future login(BuildContext context, String email, String password) async {
    final UserModel userModel = Provider.of<UserModel>(context, listen: false);
    try {
      var response = await _dio.post(kBaseUrl + '/users/auth',
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
        log('successfuly logged in with the status of 200');
        userModel.setUser(
            response.data['id'],
            response.data['token'],
            response.data['name'],
            response.data['email'],
            response.data['profile_photo_url']);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', response.data['token']);
        prefs.setString('email', email);
        prefs.setString('password', password);
        return true;
      }
    } on DioError catch (e) {
      log('Something got wrong while trying to login with the error ${e.response?.statusCode} and the message ${e.response?.data['message']}');
      return false;
    } catch (e) {
      log('Something got wrong while trying to login with the error $e');
      return false;
    }
  }

  //Requisita todos os dados de visitas
  Future getAllVisits(BuildContext context) async {
    try {
      var response = await _dio.get(
        kBaseUrl + '/visitas',
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
        kBaseUrl +
            '/empresas/$companyId/requerimento/$requirementId/documentos',
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

  Future getAllImagesFromVisits(
      {required int denunciaId, required BuildContext context}) async {
    try {
      var response = await _dio.get(
        kBaseUrl + '/denuncias/$denunciaId/fotos',
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
        log('success: ${response.data}');
        return (response.data);
      } else {
        log('Erro ao buscar fotos da denúncia');
        return null;
      }
    } on DioError catch (e) {
      log('Erro ao buscar fotos da denúncia ${e.toString()} and ${e.response!.data}');
      return null;
    } catch (e) {
      log('Erro ao buscar fotos da denúncia');
      return null;
    }
  }

  Future getVisitDoneImages(
      {required int visitId, required BuildContext context}) async {
    try {
      var response = await _dio.get(
        kBaseUrl + '/visitas/$visitId/fotos',
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
        log('success: ${response.data}');
        return (response.data);
      } else {
        log('Erro ao buscar fotos da denúncia');
        return null;
      }
    } on DioError catch (e) {
      log('Erro ao buscar fotos da denúncia ${e.toString()} and ${e.response!.data}');
      return null;
    } catch (e) {
      log('Erro ao buscar fotos da denúncia');
      return null;
    }
  }

  Future downloadSpecifiedDocument({
    required int companyId,
    required String documentName,
    required int requirementId,
    required int documentId,
    required BuildContext context,
  }) async {
    try {
      var dir = await getTemporaryDirectory();
      String fullPath = dir.path + "/$documentName.pdf'";
      var response = await _dio.download(
        kBaseUrl +
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
        log(documentFile.path);
        if (documentFile.existsSync()) {
          OpenFile.open(documentFile.path);
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future sendVisitImages({
    required int visitId,
    required List<String> imagePaths,
    required List<String> comment,
    required BuildContext context,
  }) async {
    final filesList = <MultipartFile>[];
    for (var i = 0; i < imagePaths.length; i++) {
      filesList.add(await MultipartFile.fromFile(imagePaths[i],
          filename: 'image_$i.jpg'));
    }

    final body = FormData.fromMap(
        {'id': visitId, 'image': filesList, 'comment': comment});
    try {
      var response = await _dio.post(
        kBaseUrl + '/visitas/$visitId/image',
        data: body,
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${Provider.of<UserModel>(context, listen: false).token}',
            'Content-Type': 'multipart/form-data',
            'Accept': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        return (response.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      log('error sending image: ${e.toString()} and ${e.response!.data}');
    } catch (e) {
      log('Erro: $e');
      return null;
    }
  }

  Future finishVisit(BuildContext context, int id) async {
    try {
      Response response = await _dio.post(kBaseUrl + '/visitas/$id/concluir',
          options: Options(
            headers: {
              'Authorization':
                  'Bearer ${Provider.of<UserModel>(context, listen: false).token}',
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        log('Finished visita: ${response.data}');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

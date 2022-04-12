import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  int id = 0;
  String token = '';
  String name = '';
  String email = '';
  String profilePhotoUrl = '';

  void setUser(
      int id, String token, String name, String email, String profilePhotoUrl) {
    this.id = id;
    this.token = token;
    this.name = name;
    this.email = email;
    this.profilePhotoUrl = profilePhotoUrl;
    notifyListeners();
  }
}

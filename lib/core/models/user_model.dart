import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  int id = 0;
  String refreshToken = '';
  String name = '';
  String email = '';
  String profilePhotoUrl = '';
  void setUserRefreshToken(String refreshToken) {
    this.refreshToken = refreshToken;
    notifyListeners();
  }

  void setUserName(String name) {
    this.name = name;
    notifyListeners();
  }

  void setUserEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  void setUserId(int id) {
    this.id = id;
    notifyListeners();
  }

  void setUserProfilePhotoUrl(String profilePhotoUrl) {
    this.profilePhotoUrl = profilePhotoUrl;
    notifyListeners();
  }
}

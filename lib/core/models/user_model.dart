import 'package:flutter/material.dart';

class UserModel with ChangeNotifier {
  String refreshToken = '';
  void setUserRefreshToken(String refreshToken) {
    this.refreshToken = refreshToken;
    notifyListeners();
  }
}

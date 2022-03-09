import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';

class SignInController with ChangeNotifier {
  bool isLoading = false;
  final _api = Api();

  // CREDENTIALS
  String email = '';
  String password = '';

  void signIn(BuildContext context) async {
    isLoading = true;
    _api.login(email, password).then((value) {
      isLoading = false;
      notifyListeners();
      // Navigator.pushNamed(context, HomeScreen.id);
    });
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }
}

import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/core/user_model.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';

class SignInController with ChangeNotifier {
  bool isLoading = false;
  final _api = Api();

  // CREDENTIALS
  String email = '';
  String password = '';

  void signIn(BuildContext context) async {
    isLoading = true;
    _api.login(context, email, password).then((value) {
      isLoading = false;
      notifyListeners();
      if (value == true) {
        Navigator.pushNamed(context, HomeScreen.id);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: kErrorColor,
            content: Text('Usuário ou senha inválidos. Tente novamente')));
      }
    });
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }
}

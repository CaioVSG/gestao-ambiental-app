import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenController {
  final _api = Api();
  void startApp(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () async {
      if (await userHasToken()) {
        signIn(context);
      } else {
        Navigator.popAndPushNamed(context, SignInScreen.id);
      }
    });
  }

  void signIn(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email');
    final password = prefs.getString('password');
    _api.login(context, email!, password!).then((value) {
      if (value == true) {
        log('Successfully auto signed in');
        Navigator.pushNamed(context, HomeScreen.id);
      } else {
        log('failed to log with email: $email and password: $password now going to sign in screen');
        Navigator.popAndPushNamed(context, SignInScreen.id);
      }
    });
  }

  Future<bool> userHasToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token != null) {
      log('user has token');
      log(token);
      return true;
    } else {
      log('user has no token');
      return false;
    }
  }
}

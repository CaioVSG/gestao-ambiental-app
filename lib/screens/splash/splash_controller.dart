import 'package:flutter/cupertino.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';

class SplashScreenController {
  void startApp(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.popAndPushNamed(context, SignInScreen.id);
    });
  }
}

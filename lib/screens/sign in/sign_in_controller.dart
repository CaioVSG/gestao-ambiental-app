import 'package:flutter/material.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';

class SignInController with ChangeNotifier {
  bool isLoading = false;

  void signIn(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
      notifyListeners();
      Navigator.pushNamed(context, HomeScreen.id);
    });
  }
}

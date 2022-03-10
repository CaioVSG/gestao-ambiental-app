import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/user_model.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_controller.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => SignInController(),
    ),
    ChangeNotifierProvider(create: (_) => UserModel())
  ], child: const App()));
}

import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/image_picker_controller.dart';
import 'package:meioambientemobile/core/models/user_model.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
import 'package:meioambientemobile/screens/home/home_screen_controller.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_controller.dart';
import 'package:provider/provider.dart';
import 'app.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => SignInController(),
    ),
    ChangeNotifierProvider(create: (_) => UserModel()),
    ChangeNotifierProvider(create: (_) => HomeScreenController()),
    ChangeNotifierProvider(create: (_) => ImagePickerController()),
    ChangeNotifierProvider(create: (_) => DetailsScreenController())
  ], child: const App()));
}

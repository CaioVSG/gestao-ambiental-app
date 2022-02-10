import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/theme_manager.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';
import 'package:meioambientemobile/screens/password%20recovery/password_recovery_screen.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';
import 'package:meioambientemobile/screens/splash/splash_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Gestão Ambiental - SGA Mobile',
      home: const SplashScreen(),
      theme: ThemeManager.themeData,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        PasswordRecoveryScreen.id: (context) => const PasswordRecoveryScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
      },
    );
  }
}

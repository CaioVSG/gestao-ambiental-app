import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/theme_manager.dart';
import 'package:meioambientemobile/screens/email%20auth/email_autentication_screen.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';
import 'package:meioambientemobile/screens/new%20register/new_register_screen.dart';
import 'package:meioambientemobile/screens/password%20recovery/change_password_screen.dart';
import 'package:meioambientemobile/screens/password%20recovery/password_recovery_screen.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';
import 'package:meioambientemobile/screens/splash/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      title: 'Sistema de Gestão Ambiental - SGA Mobile',
      home: const SplashScreen(),
      theme: ThemeManager.themeData,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        PasswordRecoveryScreen.id: (context) => const PasswordRecoveryScreen(),
        ChangePasswordScreen.id: (context) => const ChangePasswordScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        NewRegisterScreen.id: (context) => const NewRegisterScreen(),
        EmailAutenticationScreen.id: (context) =>
            const EmailAutenticationScreen(),
      },
    );
  }
}

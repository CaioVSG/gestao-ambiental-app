import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/theme_manager.dart';
import 'package:meioambientemobile/screens/edit%20image/edit_image_screen.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';
import 'package:meioambientemobile/screens/profile/profile_screen.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';
import 'package:meioambientemobile/screens/splash/splash_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'screens/details/details_screen.dart';

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
      title: 'Sistema de Gestão Ambiental',
      home: const SplashScreen(),
      theme: ThemeManager.themeData,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        SignInScreen.id: (context) => const SignInScreen(),
        DetailsScreen.id: (context) => const DetailsScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        EditImageScreen.id: (context) => const EditImageScreen(),
      },
    );
  }
}

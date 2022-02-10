import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashScreenController controller = SplashScreenController();
    controller.startApp(context);
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Text(
                'Sistema de Gestão Ambiental - SGA',
                textAlign: TextAlign.center,
                style: textTheme.headline5,
              ),
            ),
            const CircularProgressIndicator(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(kSmallHeight),
              child: const Text('versão: 1.0.0'),
            ),
          ],
        ),
      ),
    );
  }
}

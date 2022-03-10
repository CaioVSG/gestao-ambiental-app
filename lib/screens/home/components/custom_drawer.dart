import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
        child: Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        color: kPrimaryColor,
        child: Center(
          child: Image.asset('lib/assets/images/logo.png',
              width: size.width * 0.5),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.history),
        title: Text('Visitas Anteriores'.toUpperCase(), style: kdrawerText),
        textColor: Color(0xFF4A7836),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      const Spacer(),
      ListTile(
        leading: const Icon(Icons.exit_to_app),
        title: Text('Sair'.toUpperCase(), style: kdrawerText),
        textColor: Colors.green,
        onTap: () {
          Navigator.popAndPushNamed(context, SignInScreen.id);
        },
      ),
      const Text('Versão: 1.0.0'),
      const VerticalSpacerBox(size: SpacerSize.small)
    ]));
  }
}

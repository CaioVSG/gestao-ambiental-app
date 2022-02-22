import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Expanded(
          child: Container(
        color: kDetailColor,
      )),
      ListTile(
        leading: const Icon(Icons.history),
        title: const Text('Visitas Anteriores'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.photo_library_outlined),
        title: const Text('Galeria'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Configurações'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      const Spacer(),
      ListTile(
        leading: const Icon(Icons.exit_to_app),
        title: const Text('Sair'),
        onTap: () {
          Navigator.popAndPushNamed(context, SignInScreen.id);
        },
      ),
    ]));
  }
}

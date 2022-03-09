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
    return Drawer(
        child: Column(children: [
      Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        color: kDetailColor,
        child: Center(
          child: Text(
            'Meio Ambiente',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.history),
        title: const Text('Visitas Anteriores'),
        textColor: Colors.green,
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.camera),
        title: const Text("Galeria"),
        textColor: Colors.green,
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.engineering),
        title: const Text('Configurações'),
        textColor: Colors.green,
        onTap: () {
          Navigator.popAndPushNamed(context, SignInScreen.id);
        },
      ),
      const Spacer(),
      ListTile(
        leading: const Icon(Icons.exit_to_app),
        title: const Text('Sair'),
        textColor: Colors.green,
        onTap: () {
          Navigator.popAndPushNamed(context, SignInScreen.id);
        },
      ),
      const Spacer(),
      const Text('Versão: 1.0.0'),
      const VerticalSpacerBox(size: SpacerSize.small)
    ]));
  }
}

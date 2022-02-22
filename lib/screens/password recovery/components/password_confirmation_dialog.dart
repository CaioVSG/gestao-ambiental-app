import 'package:flutter/material.dart';
import 'package:meioambientemobile/screens/sign%20in/sign_in_screen.dart';

class PasswordConfirmationDialog extends StatelessWidget {
  const PasswordConfirmationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Navigator.pushNamedAndRemoveUntil(
    //                         context, SignInScreen.id, (route) => false);
    return AlertDialog(
      title: const Text('Tudo certo.'),
      content: const Text('Agora pode fazer login com sua senha.'),
      actions: <Widget>[
        ElevatedButton(
          child: const Text('Fazer login'),
          onPressed: () {
            Navigator.popAndPushNamed(context, SignInScreen.id);
          },
        ),
      ],
    );
  }
}

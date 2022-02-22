import 'package:flutter/material.dart';
import 'package:meioambientemobile/screens/password%20recovery/change_password_screen.dart';

class CodeVerificationDialog extends StatelessWidget {
  const CodeVerificationDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, ChangePasswordScreen.id, (route) => false);
    });

    return const AlertDialog(
      title: Text('Aguarde...'),
      content: Text('Estamos validando seu código de verificação.'),
    );
  }
}

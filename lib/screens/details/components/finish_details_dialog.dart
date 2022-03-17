import 'package:flutter/material.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';

class FinishVisitDialog extends StatelessWidget {
  const FinishVisitDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("Concluir Visita?"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar')),
        TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, HomeScreen.id);
            },
            child: Text('Concluir'))
      ],
    );
  }
}

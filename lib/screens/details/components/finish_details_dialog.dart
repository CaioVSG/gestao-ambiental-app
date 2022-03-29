import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';

class FinishVisitDialog extends StatelessWidget {
  const FinishVisitDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Concluir Visita?',
        style: KHomeScreen2,
      ),
      content: const Text(
        "Você não pode desfazer este processo!",
        style: kdrawerText,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancelar',
              style: kdrawerText,
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, HomeScreen.id);
            },
            child: const Text(
              'Concluir',
              style: KTextDetails,
            )),
      ],
    );
  }
}

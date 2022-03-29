import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class DocsScreen extends StatelessWidget {
  const DocsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'DOCUMENTOS',
        style: KHomeScreen2,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Anexo 1", style: kdrawerText),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.download,
              color: kDetailColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Fechar',
              style: KUnderline,
            )),
      ],
    );
  }
}

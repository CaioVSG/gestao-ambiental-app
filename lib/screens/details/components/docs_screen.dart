import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class DocsDialog extends StatelessWidget {
  const DocsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      title: const Text(
        'DOCUMENTOS',
        style: kHomeScreen2,
      ),
      content: SizedBox(
        height: size.height * 0.6,
        width: size.width * 0.8,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return DocTile(title: 'title');
          },
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Fechar',
              style: kUnderline,
            )),
      ],
    );
  }
}

class DocTile extends StatelessWidget {
  const DocTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title, style: kdrawerText),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.download,
            color: kDetailColor,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}

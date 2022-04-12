import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/general_loader.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/screens/details/details_screen_controller.dart';
import 'package:provider/provider.dart';

class FinishVisitDialog extends StatelessWidget {
  const FinishVisitDialog({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Concluir Visita?',
        style: kHomeScreen2,
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
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => const Dialog(
                        child: GeneralLoader(),
                      ));
              Provider.of<DetailsScreenController>(context, listen: false)
                  .finishVisit(context, id);
            },
            child: const Text(
              'Concluir',
              style: kTextDetails,
            )),
      ],
    );
  }
}

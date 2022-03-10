import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class VisitTile extends StatelessWidget {
  final String title;
  final String VisitDate;
  final String CriationDate;
  final VoidCallback onTap;
  const VisitTile({
    Key? key,
    required this.title,
    required this.VisitDate,
    required this.CriationDate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tipo: '),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Icon(Icons.location_on),
              Text(
                title,
                style: textTheme.headline6,
              ),
              const Spacer(),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.event_available),
                      Text('Data de Visita: ' + VisitDate,
                          style: textTheme.subtitle1),
                    ],
                  ),
                  VerticalSpacerBox(size: SpacerSize.tiny),
                  Row(
                    children: [
                      Icon(Icons.event, color: kDetailColor),
                      Text('Data de Criação: ' + CriationDate,
                          style: textTheme.subtitle1),
                    ],
                  ),
                ],
              ),
            ]),
            Row(
              children: [
                Icon(Icons.business),
                Text('Empresa: '),
              ],
            )
          ],
        ),
      ),
    );
  }
}

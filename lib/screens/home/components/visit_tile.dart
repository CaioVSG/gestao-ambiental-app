import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/horizontal_spacer_box.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class VisitTile extends StatelessWidget {
  final String title;
  // ignore: non_constant_identifier_names
  final String visitDate;
  final String empresa;
  final VoidCallback onTap;
  final String business;
  final String tipo;
  const VisitTile({
    Key? key,
    required this.title,
    // ignore: non_constant_identifier_names
    required this.visitDate,
    required this.empresa,
    required this.onTap,
    required this.business,
    required this.tipo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(kMediumtHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.description,
                  color: Colors.white,
                ),
                const HorizontalSpacerBox(size: SpacerSize.tiny),
                Text(tipo.toUpperCase(), style: kText),
              ],
            ),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
              const HorizontalSpacerBox(size: SpacerSize.tiny),
              Text(
                title,
                style: kTextDetails,
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Icon(
                Icons.business,
                color: Colors.white,
              ),
              const HorizontalSpacerBox(size: SpacerSize.tiny),
              Text(
                empresa,
                style: kTextDetails,
              ),
            ]),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.event,
                  color: Colors.white,
                  size: 27,
                ),
                const HorizontalSpacerBox(size: SpacerSize.tiny),
                Text(
                  visitDate,
                  style: kText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

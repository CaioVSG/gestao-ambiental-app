import 'package:flutter/material.dart';
import 'package:meioambientemobile/components/horizontal_spacer_box.dart';
import 'package:meioambientemobile/components/vertical_spacer_box.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/util/custom_date_formater.dart';

class VisitTile extends StatelessWidget {
  final String title;
  // ignore: non_constant_identifier_names
  final String visitDate;
  final String empresa;
  final VoidCallback onTap;
  final String business;
  final String tipo;

  final String street;
  final String number;
  const VisitTile(
      {Key? key,
      required this.title,
      // ignore: non_constant_identifier_names
      required this.visitDate,
      required this.empresa,
      required this.onTap,
      required this.business,
      required this.tipo,
      required this.street,
      required this.number})
      : super(key: key);

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
            const VerticalSpacerBox(size: SpacerSize.small),
            Text(
              street + ' ,$number',
              style: kSubtitleTextStyle,
            ),
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
                  CustomDateFormater.dateTimeWithHourToString(
                      CustomDateFormater.stringToDateTime(visitDate)),
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

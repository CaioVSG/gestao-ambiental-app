import 'package:flutter/material.dart';

class VisitTile extends StatelessWidget {
  final String title;
  final String date;
  const VisitTile({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Text(
        title,
        style: textTheme.headline6,
      ),
      Text(date, style: textTheme.subtitle1),
    ]);
  }
}

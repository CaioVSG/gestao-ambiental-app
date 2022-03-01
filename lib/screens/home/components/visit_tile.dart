import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class VisitTile extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback onTap;
  const VisitTile({
    Key? key,
    required this.title,
    required this.date,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(kDefaultRadius),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(Icons.location_on),
          Text(
            title,
            style: textTheme.headline6,
          ),
          const Spacer(),
          Text(date, style: textTheme.subtitle1),
        ]),
      ),
    );
  }
}

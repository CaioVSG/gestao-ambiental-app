import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';

class FilterDate extends StatelessWidget {
  const FilterDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text(
        'Filtrar Datas de visitas',
        style: kHomeScreen2,
      ),
      content: Text(
        "Filtrar",
        style: kdrawerText,
      ),
      actions: [],
    );
  }
}

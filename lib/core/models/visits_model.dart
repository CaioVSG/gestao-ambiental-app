import 'package:flutter/material.dart';

class VisitsModel with ChangeNotifier {
  //**DADOS DA VISITAS */
  final String visitDate;
  final String createdAt;

  VisitsModel({
    required this.visitDate,
    required this.createdAt,
  });
}

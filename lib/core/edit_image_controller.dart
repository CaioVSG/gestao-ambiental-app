import 'package:flutter/cupertino.dart';

class EditImageController with ChangeNotifier {
  final String defaultEditingText =
      'Esta imagem ainda não tem nenhuma descrição.';
  String imageDescriptionText = '';

  void setImageDescriptionText(String text) {
    imageDescriptionText = text;
    notifyListeners();
  }
}

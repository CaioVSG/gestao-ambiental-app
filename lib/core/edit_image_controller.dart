import 'package:flutter/cupertino.dart';

class EditImageController with ChangeNotifier {
  final String defaultEditingText =
      'Esta imagem ainda não tem nenhuma descrição.';
  List<String> imageDescriptionText = [];

  void setImageDescriptionText(String text) {
    imageDescriptionText[0] = text;
    notifyListeners();
  }
}

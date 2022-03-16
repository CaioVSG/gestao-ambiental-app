import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/image_picker_controller.dart';

class DetailsScreenController with ChangeNotifier {
  final _imagePickerController = ImagePickerController();
  void selectImages() {
    _imagePickerController.PickFile();
  }
}

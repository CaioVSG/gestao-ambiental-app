import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/image_picker_controller.dart';
import '../../core/api.dart';

class DetailsScreenController with ChangeNotifier {
  bool isLoading = false;
  final _api = Api();
  final _imagePickerController = ImagePickerController();
  void selectImages() {
    _imagePickerController.PickFile();
  }

  Future getAllVisits(BuildContext context) async {
    isLoading = true;
    _api.getAllVisits(context).then((value) {
      isLoading = false;
      if (value != null) {
      } else {
        //print('Deu Ruim');
      }
    });
  }
}

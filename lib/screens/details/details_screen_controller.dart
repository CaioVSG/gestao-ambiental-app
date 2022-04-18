import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meioambientemobile/constants/style/constants.dart';
import 'package:meioambientemobile/core/api.dart';
import 'package:meioambientemobile/core/image_picker_controller.dart';
import 'package:meioambientemobile/screens/home/home_screen.dart';

class DetailsScreenController with ChangeNotifier {
  final _api = Api();

  bool isLoading = false;
  final _imagePickerController = ImagePickerController();
  int _selectedImageLength = 0;
  int? _selectedImageIndex;
  bool _showCommentSection = false;

  List<File> _selectedImages = [];

  List<File> get selectedImages => _selectedImages;
  set selectedImages(List<File> value) {
    _selectedImages = value;
    notifyListeners();
  }

  int get selectedImageIndex => _selectedImageIndex!;
  set selectedImageIndex(int value) {
    _selectedImageIndex = value;
    notifyListeners();
  }

  int get selectedImageLength => _selectedImageLength;
  get showCommentSection => _showCommentSection;

  set selectedImageLength(int length) {
    _selectedImageLength = length;
    notifyListeners();
  }

  set setCommentSection(bool value) {
    _showCommentSection = value;
    notifyListeners();
  }

  getSpecifiedDocument(
      {required int companyId,
      required int requirementId,
      required int documentId,
      required BuildContext context}) async {
    isLoading = true;
    notifyListeners();
    var response = await _api.downloadSpecifiedDocument(
        companyId: companyId,
        requirementId: requirementId,
        documentId: documentId,
        context: context);
    isLoading = false;
    notifyListeners();
    if (response == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: kErrorColor,
          content: Text('Erro ao baixar documento'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  finishVisit(BuildContext context, int id) async {
    _api.finishVisit(context, id).then((value) {
      if (value) {
        Navigator.of(context).popAndPushNamed(HomeScreen.id);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: kDetailColor2,
            content: Text('Visita finalizada com sucesso!'),
            duration: Duration(seconds: 2),
          ),
        );
        _selectedImages.clear();
        _selectedImageLength = 0;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: kErrorColor,
            content: Text('Erro ao finalizar visita!'),
            duration: Duration(seconds: 2),
          ),
        );
        int screenCounter = 0;
        Navigator.of(context).popUntil((route) {
          return screenCounter++ >= 2;
        });
      }
    });
  }

  Future selectImages() async {
    List<File>? files = await _imagePickerController.pickImagesFromGalery();
    selectedImageLength = files!.length;
    selectedImages = files;
  }

  void deleteSelectedImage() {
    selectedImages.removeAt(selectedImageIndex);
    selectedImageLength = selectedImages.length;
  }
}

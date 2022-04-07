import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meioambientemobile/core/image_picker_controller.dart';
import '../../core/api.dart';

class DetailsScreenController with ChangeNotifier {
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

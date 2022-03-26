import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImagePickerController with ChangeNotifier {
  // ignore: non_constant_identifier_names
  Future<void> PickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        allowedExtensions: ['jpeg', 'png', 'jpg'],
        type: FileType.custom);

    if (result != null) {
      List<File> files = result.paths.map((path) => File('')).toList();
    } else {
      // User canceled the picker
    }
  }
}

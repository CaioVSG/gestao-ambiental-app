import 'package:flutter/cupertino.dart';

class DownloaderController with ChangeNotifier {
  String? percentage;
  void showDownloadProgress(int received, int total) {
    if (total != -1) {
      percentage = (received / total * 100).toStringAsFixed(0) + "%";
    } else {
      percentage = "completo";
    }
    notifyListeners();
  }
}

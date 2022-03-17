import 'package:flutter/cupertino.dart';
import 'package:meioambientemobile/core/api.dart';

class HomeScreenController with ChangeNotifier {
  bool isLoading = false;
  final _api = Api();

  Future getAllVisits(BuildContext context) async {
    print('getting');

    isLoading = true;
    _api.getAllVisits(context).then((value) {
      isLoading = false;
      if (value != null) {
      } else {
        print('Deu Ruim');
      }
    });
  }
}

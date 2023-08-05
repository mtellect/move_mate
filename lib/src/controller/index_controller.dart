import 'package:flutter/foundation.dart';

class IndexController extends ChangeNotifier {
  bool isTabVisible = true;

  void setTabVisiblity(bool show) {
    isTabVisible = show;
    notifyListeners();
  }
}

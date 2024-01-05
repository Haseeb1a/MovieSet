import 'package:flutter/material.dart';

class DatailsController extends ChangeNotifier {
  bool selected = true;
  double opacity = 0.1;

  DatailsController() {
    opacitychange();
  }
  chnager() {
    selected = !selected;
    notifyListeners();
  }

  Future opacitychange() async {
    //  print(opacity);
    //  Future.delayed(Duration(seconds: 2), () {
      opacity = 1.0;
      print(opacity);
      notifyListeners();
    // });
  }
}

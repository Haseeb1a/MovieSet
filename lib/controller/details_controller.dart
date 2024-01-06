import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatailsController extends ChangeNotifier {
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('yyyy-MM-dd').format(now);
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

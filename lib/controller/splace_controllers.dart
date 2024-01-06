import 'package:flutter/material.dart';

class SplaceController extends ChangeNotifier {
  bool isFinished = false;

  Future onWaitingProcess() async {
    await Future.delayed(const Duration(seconds: 1), () {
      isFinished = true;
      notifyListeners();
    });
  }

  transformation() {
    isFinished = false;
    notifyListeners();
  }
}

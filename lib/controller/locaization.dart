import 'package:flutter/material.dart';
import 'package:movieset/l10n/l10.n.dart';

class LocilizationController extends ChangeNotifier {
  Locale locale = const Locale('en');

  setLanguage(Locale locales) {
    if (L10n.all.contains(locales)) {
      locale = locales;
      notifyListeners();
    }
  }
 
}

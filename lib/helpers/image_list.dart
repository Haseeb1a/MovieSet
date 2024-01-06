import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Serivces {
  List<Map<String, dynamic>> dataList = [];
  final BuildContext context;
  Serivces(this.context) {
    dataList.addAll([
      {
        "title": AppLocalizations.of(context)!.goodboystitle,
        "image": "assets/good_boys.jpg",
        "index": 1,
        "rating": 1,
        "decription": AppLocalizations.of(context)!.goodboydetails
      },
      {
        "title": AppLocalizations.of(context)!.jockertitle,
        "image": "assets/jocket.jpeg",
        "index": 2,
        "rating": 4,
        "decription": AppLocalizations.of(context)!.jockerdetails,
      },
      {
        "title": AppLocalizations.of(context)!.batmantitle,
        "image": "assets/bataman2.jpg",
        "index": 3,
        "rating": 5,
        "decription":  AppLocalizations.of(context)!.batmandetails
      },
      {
        "title": AppLocalizations.of(context)!.lionkingtitle,
        "image": "assets/lion_king.jpg",
        "index": 4,
        "rating": 3,
        "decription": AppLocalizations.of(context)!.lionkingdetails
      }
    ]);
  }
}

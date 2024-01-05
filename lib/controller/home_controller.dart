import 'package:flutter/material.dart';
import 'package:movieset/helpers/image_list.dart';
import 'package:movieset/model/movie_model.dart';

class HomepageController extends ChangeNotifier {
  List<Movies> movies = [];
  late PageController pagecontrller;
  int curnetIntex = 0;
  double pagevalue = 0.0;
  List aaa = [];

  List<void> reverse() {
    aaa = movies.reversed.toList();
    notifyListeners();
    return aaa;
  }

  HomepageController() {
    setingMapToModel();
    reverse();
  }

    setingMapToModel() {
      movies = dataList
          .map((data) => Movies(
                title: data['title'],
                image: data['image'],
                index: data['index'],
                rating:data['rating'],
                decription: data['decription']
              ))
          .toList();

      pagecontrller =
          PageController(viewportFraction: 0.8, initialPage: curnetIntex)
            ..addListener(() {
              pagevalue = pagecontrller.page!;
              notifyListeners();
            });
      notifyListeners();
    }

  changer(int index) {
    curnetIntex = index;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:movieset/view/image_cliper.dart';

class ImageSlider extends StatelessWidget {
  //  Animation double=;
  final int index;
  final String image;
  final double pagevalue;

  const ImageSlider(
      {super.key,
      required this.index,
      required this.image,
      required this.pagevalue,
      f});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: ImageClipper(progress: getProgress()),
        child: Image.asset(
          image,
          height: double.infinity,
          fit: BoxFit.cover,
        
        ));
  }

  double getProgress() {
    if (index == pagevalue.floor()) {
      return 1.0 - (pagevalue - index);
    } else if (index < pagevalue.floor()) {
      return 0.0;
    } else {
      return 1.0;
    }
    // return 1.0;
  }
}

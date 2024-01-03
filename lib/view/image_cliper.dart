import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageClipper extends CustomClipper<Path> {
  final double progress;
  ImageClipper({required this.progress});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(Rect.fromLTRB(size.width-(size.width*progress), 0, size.width, size.height));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

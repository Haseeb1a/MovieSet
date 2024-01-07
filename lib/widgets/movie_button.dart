import 'package:flutter/material.dart';
import 'package:movieset/helpers/appcolors.dart';
import 'package:movieset/view/details_page/details_page.dart';

class MovieButtion extends StatelessWidget {
  String text;
//  final int index;
  MovieButtion({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 62.0),
      padding: EdgeInsets.symmetric(vertical: 18.0),
      decoration: BoxDecoration(
          color: blackcolor, borderRadius: BorderRadius.circular(18)),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MovieButtion extends StatelessWidget {
  const MovieButtion({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 62.0),
      padding: EdgeInsets.symmetric(vertical: 18.0),
      decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(18)),
      alignment: Alignment.center,
      child: Text('VIEW',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),



    );
  }
}
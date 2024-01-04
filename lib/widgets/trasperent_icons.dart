import 'package:flutter/material.dart';

class trasparent_Button extends StatelessWidget {
  final Icon icons;
  const trasparent_Button({
    required this.icons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(146, 58, 52, 52),
      ),
      height: 50,
      width: 50,
      child: icons
    );
  }
}
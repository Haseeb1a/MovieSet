import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:ticket_widget/ticket_widget.dart';

// class MovieTicketClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, size.height * 0.8);

//     // Left curve
//     path.quadraticBezierTo(
//         size.width * 0.25, size.height, size.width * 0.5, size.height * 0.8);

//     // Bottom curve
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.6, size.width, size.height * 0.8);

//     path.lineTo(size.width, 0);

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }

class MovieTicket extends StatelessWidget {
  const MovieTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          TicketWidget(width: 300, height: 500, child: TicketCard())
          // ClipPath(
          //   clipper: StarClipper(2),
          //   child: Container(
          //     child: Column(
          //       children: [
          //         Text('----------------')
          //       ],
          //     ),
          //     height: 470,
          //     width: 300,
          //     decoration: BoxDecoration(
          //       color: Color.fromARGB(255, 255, 255, 255),
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         Text('dhfgdh'),
         Text('nbkdf')
      ],
    );
  }
}
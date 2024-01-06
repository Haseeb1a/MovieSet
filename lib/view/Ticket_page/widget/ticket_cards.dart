
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';

class TicketCard extends StatelessWidget {
  final String poster;
  final String moviename;
  const TicketCard({super.key, required this.poster, required this.moviename});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    // String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Movie',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(moviename,
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
                SizedBox(
                  height: 20,
                ),
                Text('Date',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(
                   DateFormat('yyyy-MM-dd').format(now),
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Hero(
                 tag: 'movedata',
              child: ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Image.asset(
                  poster,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 170,
                ),
              ),
            )
            // )
          ],
        ),
        Text('Time',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text('10:00 PM', style: TextStyle(fontSize: 17)),
        Text('------------------------',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
        TweenAnimationBuilder(
          curve: Curves.easeInOutBack,
          tween: Tween<double>(begin: 100, end: 200),
          duration: Duration(seconds: 2),
          builder: (context, value, child) {
            return SizedBox(
              height: value,
              width: value,
              child: Image.asset(
                'assets/QR.png',
                fit: BoxFit.cover,
              ),
            );
          },
        )
      ],
    );
  }
}

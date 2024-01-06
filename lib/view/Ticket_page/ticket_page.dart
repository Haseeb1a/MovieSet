import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';
import 'package:movieset/model/movie_model.dart';
import 'package:movieset/view/ticket_page/ticket_card.dart';
import 'package:movieset/widgets/trasperent_icons.dart';
import 'package:ticket_widget/ticket_widget.dart';
class MovieTicket extends StatelessWidget {
  final Movies movies;
  const MovieTicket({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: trasparent_Button(
                          icons: Icon(
                        Icons.chevron_left,
                        color: Colors.white,
                      ))),
                ),
              ],
            ),
            Center(
                child: TicketWidget(
              width: 300,
              height: 500,
              child: TicketCard(
                poster: movies.image,
                moviename: movies.title,
              ),
              color: Color.fromARGB(255, 255, 255, 255),
            )),
            SizedBox(
              height: 70,
              width: 250,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shadowColor: Colors.white),
                  onPressed: () {},
                  child: Text(
                    'Share',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

// class TicketCard extends StatelessWidget {
//   final String poster;
//   final String moviename;
//   const TicketCard({super.key, required this.poster, required this.moviename});

//   @override
//   Widget build(BuildContext context) {
//     DateTime now = DateTime.now();
//     String formattedDate = DateFormat('yyyy-MM-dd').format(now);

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Movie',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(moviename,
//                     style:
//                         TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Text('Date',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                 Text(
//                   formattedDate,
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ],
//             ),
//             Hero(
//                  tag: 'movedata',
//               child: ClipPath(
//                 clipper: OvalBottomBorderClipper(),
//                 child: Image.asset(
//                   poster,
//                   fit: BoxFit.cover,
//                   width: 150,
//                   height: 170,
//                 ),
//               ),
//             )
//             // )
//           ],
//         ),
//         Text('Time',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//         Text('10:00 PM', style: TextStyle(fontSize: 17)),
//         Text('------------------------',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
//         TweenAnimationBuilder(
//           curve: Curves.easeInOutBack,
//           tween: Tween<double>(begin: 100, end: 200),
//           duration: Duration(seconds: 2),
//           builder: (context, value, child) {
//             return SizedBox(
//               height: value,
//               width: value,
//               child: Image.asset(
//                 'assets/QR.png',
//                 fit: BoxFit.cover,
//               ),
//             );
//           },
//         )
//       ],
//     );
//   }
// }

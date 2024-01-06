import 'package:flutter/material.dart';
import 'package:movieset/helpers/appcolors.dart';
import 'package:movieset/model/movie_model.dart';
import 'package:movieset/view/ticket_page/widget/ticket_cards.dart';
import 'package:movieset/widgets/trasperent_icons.dart';

// 'ticket_cards.dart'rt';
import 'package:ticket_widget/ticket_widget.dart';
class MovieTicket extends StatelessWidget {
  final Movies movies;
  const MovieTicket({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackcolor,
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
                        color: whitecolor,
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
              color: whitecolor,
            )),
            SizedBox(
              height: 70,
              width: 250,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shadowColor: whitecolor),
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

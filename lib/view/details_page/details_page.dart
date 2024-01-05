import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieset/controller/details_controller.dart';
import 'package:movieset/model/movie_model.dart';
import 'package:movieset/view/Ticket_page/ticket_page.dart';
import 'package:movieset/view/home_page.dart';
import 'package:movieset/widgets/movie_button.dart';
import 'package:movieset/widgets/trasperent_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final Movies movies;
  DetailsPage({super.key, required this.movies});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  bool isPlay = false;
  late AnimationController _controller;

  @override
  void initState() {
    // final alinprovider = Provider.of<DatailsController>(context,listen: false);
    // TODO: implement initState
    //  Future
    //  Future.delayed(Duration(seconds: 1))
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  Widget build(BuildContext context) {
    final alinprovider = Provider.of<DatailsController>(context);
     Provider.of<DatailsController>(context).opacitychange();
    Size screenSize = MediaQuery.of(context).size;
    //  late  AnimationController controller;
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              // decoration: BoxDecoration(),
              height: 300,
              width: double.infinity,
              child: Hero(
                tag: 'movedata',
                child: ClipPath(
                  clipper: ShapeBorderClipper(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        17.0), // Adjust the radius as needed
                  )),
                  child: Image.asset(
                    widget.movies.image,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 150,
                left: (screenSize.width - 50) / 2,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (isPlay == false) {
                        _controller.forward();
                        isPlay = true;
                      } else {
                        _controller.reverse();
                        isPlay = false;
                      }
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: _controller,
                        size: 50,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                )),
            Positioned(
                top: 30,
                left: 20,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      alinprovider.opacity = 0.1;
                      // MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: const trasparent_Button(
                        icons: Icon(
                      Icons.chevron_left_outlined,
                      color: Colors.white,
                    )))),
          ]),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.movies.title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 27)),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        alinprovider.chnager();
                      },
                      child: AnimatedCrossFade(
                        secondChild: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(
                            Icons.favorite,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                        firstChild: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 37,
                        ),
                        crossFadeState: alinprovider.selected
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: Duration(milliseconds: 700),
                      ),
                    ),
                    Text('Like', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      progressColor: Colors.yellow,
                      animationDuration: 2000,
                      radius: 23,
                      animation: true,
                      percent: widget.movies.rating / 5,
                      lineWidth: 6,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.movies.rating.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star_sharp,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text('rating',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
                // Column(
                //   children: [
                //     GestureDetector(
                //       onTap: (){
                //          alinprovider.chnager();
                //       },
                //       child: AnimatedCrossFade(
                //         secondChild:Icon(
                //           Icons.favorite,
                //           color: Colors.black,
                //            size: 25,
                //         ) ,
                //         firstChild:
                //          Icon(
                //           Icons.favorite,
                //           color: Colors.red,
                //           size: 30,
                //         ),
                //          crossFadeState: alinprovider.selected
                //                     ? CrossFadeState.showFirst
                //                     : CrossFadeState.showSecond,
                //                 duration: Duration(milliseconds: 700),
                //       ),
                //     ),
                //     Text('Like', style: TextStyle(fontWeight: FontWeight.bold)),
                //   ],
                // ),

                //  AnimatedIcon(
                //   icon: AnimatedIcons.play_pause,
                //   progress: controller,
                //   size: 100,
                // ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AnimatedOpacity(
              opacity: alinprovider.opacity,
              duration: Duration(seconds: 2),
              child: Text(
                widget.movies.decription,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieTicket(
                                movies: widget.movies,
                              )));
                },
                child: MovieButtion(
                  text: ' Free Ticket  ',
                )),
          )
        ],
      ),
    );
  }
}

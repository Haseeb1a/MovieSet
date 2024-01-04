import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:movieset/view/drawer_page/darawer_page.dart';
import 'package:movieset/view/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({super.key});

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
   bool isFinished = false;
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Center(
              child: Container(
              height: 250,
              width: double.infinity,
              color: Color.fromARGB(255, 255, 0, 0),
            ),
            ),
            // Container(
            //   height: 350,
            //   width: double.infinity,
            //   color: Color.fromARGB(255, 255, 255, 255),
            // )
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Lottie.asset('assets/Animation - 1704300923812.json',
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SwipeableButtonView(
              
              isFinished: isFinished,
              onFinish: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child:  MyHomepage()));
                setState(() {
                  isFinished = false;
                });
              },
              onWaitingProcess: () {
                Future.delayed(const Duration(seconds:1), () {
                  setState(() {
                    isFinished = true;
                  });
                });
              },
              buttonColor: const Color.fromARGB(255, 255, 17, 0),
              activeColor: Color.fromARGB(255, 255, 255, 255),
              buttonWidget: Icon(
                Icons.arrow_forward_ios_rounded,
                
                color: Colors.white,
              ),
              buttonText: 'swipe to continue',
              buttontextstyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          )
        ],
      ),
    );
  }
}

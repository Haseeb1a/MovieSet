import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:movieset/controller/splace_controllers.dart';
import 'package:movieset/helpers/appcolors.dart';
import 'package:movieset/view/drawer_page/darawer_page.dart';
import 'package:movieset/view/home_page/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplaceScreen extends StatelessWidget {
   SplaceScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final splaceprovider = Provider.of<SplaceController>(context);
    return Scaffold(
      backgroundColor: blackcolor,
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
                color:redcolor,
              ),
            ),
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
              isFinished:splaceprovider.isFinished,
              onFinish: ()  {
                 Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.fade, child: MyHomepage()));
                splaceprovider.transformation();
              },
              onWaitingProcess: () {
                splaceprovider.onWaitingProcess();
              },
              buttonColor: redcolor,
              activeColor: whitecolor,
              buttonWidget: Icon(
                Icons.arrow_forward_ios_rounded,
                color: whitecolor,
              ),
              buttonText: 'MOVE TO MOVIESET',
              buttontextstyle:
                  TextStyle(fontSize: 20, color:blackcolor),
            ),
          )
        ],
      ),
    );
  }
}

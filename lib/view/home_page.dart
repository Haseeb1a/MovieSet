import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieset/model/movie_model.dart';
import 'package:movieset/widgets/animated_page.dart';
import 'package:provider/provider.dart';
import 'package:movieset/controller/home_controller.dart';
import 'package:movieset/view/move_datails_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeProviders = Provider.of<HomepageController>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      child: Scaffold(
          backgroundColor: Colors.black,
          body: AnimationPages(   
            
            pageController: homeProviders.pagecontrller,
            pagevalue: homeProviders.pagevalue,
            child: (index, _) {
              return MovieDetails(movies:homeProviders.movies[index]);
            },
            pageCount: homeProviders.movies.length,
            onpageChnageCallback: (index) {
              homeProviders.changer(index);
            },
          )
          //  PageView.builder(
          //   controller: homeProviders.pagecontrller,
          //   itemCount: homeProviders.movies.length,

          //   itemBuilder: (context, index) {

          // return    MovieDetails(
          //       movies: homeProviders.movies[index],
          //     );
          //   },
          // ),
          ),
    );
  }
}

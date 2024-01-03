import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieset/model/movie_model.dart';
import 'package:movieset/widgets/animated_page.dart';
import 'package:movieset/widgets/image_slider.dart';
import 'package:movieset/widgets/movie_button.dart';
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
    final reveselist=homeProviders.movies.reversed.toList();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      
      child: Scaffold(
        
          backgroundColor: Colors.black,
          body: Stack(
            children:[

              Stack(
                children:
                    reveselist.map((movie) => ImageSlider(index: movie.index-1, image: movie.image, pagevalue: homeProviders.pagevalue)).toList()
                  
                ,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.centerRight,end:Alignment.bottomCenter
                  ,colors: [Colors.transparent,Colors.white],stops: [0.3,0.8] ),
                  
                ),
              ),
              
               AnimationPages(   
              
              pageController: homeProviders.pagecontrller,
              pagevalue: homeProviders.pagevalue,
              child: (index, _) {
                return MovieDetails(movies:homeProviders.movies[index]);
              },
              pageCount: homeProviders.movies.length,
              onpageChnageCallback: (index) {
                homeProviders.changer(index);
              },

              
            ),
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: MovieButtion())
            ]
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

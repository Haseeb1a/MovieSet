import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movieset/model/movie_model.dart';
import 'package:movieset/view/details_page/details_page.dart';
import 'package:movieset/widgets/animated_page.dart';
import 'package:movieset/widgets/image_slider.dart';
import 'package:movieset/widgets/movie_button.dart';
import 'package:movieset/widgets/trasperent_icons.dart';
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
    final reveselist = homeProviders.movies.reversed.toList();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      child: Scaffold(
          // appBar: AppBar(
          //   leading: IconButton(
          //     onPressed: () {
          //       ZoomDrawer.of(context)!.toggle();
          //     },
          //     icon: Icon(Icons.menu,color: Colors.white,),
          //   ),
          //   toolbarHeight: 30,
          //   backgroundColor: Colors.black,
          // ),
          backgroundColor: Colors.black,
          body: Stack(children: [
            Stack(
              children: reveselist
                  .map((movie) => ImageSlider(
                      index: movie.index - 1,
                      image: movie.image,
                      pagevalue: homeProviders.pagevalue))
                  .toList(),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color.fromARGB(255, 255, 255, 255)
                    ],
                    stops: [
                      0.3,
                      0.8
                    ]),
              ),
            ),
            AnimationPages(
              pageController: homeProviders.pagecontrller,
              pagevalue: homeProviders.pagevalue,
              child: (index, _) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                movies: homeProviders.movies[index])));
                  },
                  child: Hero(
                      tag: 'movedata',
                      child: MovieDetails(movies: homeProviders.movies[index])),
                );
              },
              pageCount: homeProviders.movies.length,
              onpageChnageCallback: (index) {
                homeProviders.changer(index);
              },
            ),
            // Positioned(bottom: 32, left: 0, right: 0, child: MovieButtion()),
            Positioned(
              top: 30,
              left: 30,
              child: GestureDetector(
                onTap: (){
                   ZoomDrawer.of(context)!.toggle();
                },
                child: trasparent_Button(
                  icons: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ])

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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movieset/view/details_page/details_page.dart';
import 'package:movieset/widgets/animated_page.dart';
import 'package:movieset/widgets/image_slider.dart';
import 'package:movieset/widgets/trasperent_icons.dart';
import 'package:provider/provider.dart';
import 'package:movieset/controller/home_controller.dart';
import 'package:movieset/view/home_page/widgets/move_datails_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProviders = Provider.of<HomepageController>(context);
    homeProviders.setingMapToModel(context);
    final reveselist = homeProviders.movies.reversed.toList();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      child: Scaffold(
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
            // container on the with smoke e
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 255, 255, 255),
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
            Positioned(
              top: 30,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  ZoomDrawer.of(context)!.toggle();
                },
                child: const trasparent_Button(
                  icons: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}

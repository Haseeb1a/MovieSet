import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movieset/controller/locaization.dart';
import 'package:movieset/helpers/appcolors.dart';
import 'package:movieset/view/home_page/home_page.dart';
import 'package:provider/provider.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
      mainScreen: HomePage(),
      menuScreen: MenuScreenPage(),
      borderRadius: 24.0,
      showShadow: true,
      drawerShadowsBackgroundColor: blackcolor,
      menuBackgroundColor: whitecolor,
    );
  }
}

class MenuScreenPage extends StatelessWidget {
  const MenuScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizationprovider = Provider.of<LocilizationController>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ListTile(
            leading: CircleAvatar(
                backgroundColor: Color.fromARGB(18, 0, 0, 0),
                child: Icon(
                  Icons.home,
                  color: blackcolor,
                )),
            title: Text(
              'home',
              style: TextStyle(
                  color:blackcolor,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ExpansionTile(
              // shape: Border(),
              leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(18, 0, 0, 0),
                  child: Icon(
                    Icons.language,
                    color: blackcolor,
                  )),
              title: const Text(
                'language',
                style: TextStyle(
                    color: blackcolor,
                    fontWeight: FontWeight.bold),
              ),
              children: [
                ListTile(
                  //  leading:  Icon(Icons.language,color: Colors.black,),
                  title: GestureDetector(
      onTap: () {
                    localizationprovider.setLanguage(const Locale('hi'));
                  },
                    child: Text(
                      'Hindi',
                      style: TextStyle(
                          color: blackcolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                     localizationprovider.setLanguage(const Locale('en'));
                  },
                  child:  const ListTile(
                    //  leading:  Icon(Icons.language,color: Colors.black,),
                    title: Text(
                      'English',
                      style: TextStyle(
                          color: blackcolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                     localizationprovider.setLanguage(const Locale('ar'));
                  },
                  child: const ListTile(
                    //  leading:  Icon(Icons.language,color: Colors.black,),
                    title: Text(
                      'Arabic',
                      style: TextStyle(
                          color: blackcolor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ]),
        ],
      ),
    );
  }
}

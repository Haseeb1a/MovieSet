import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movieset/view/home_page/home_page.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
      mainScreen: HomePage(),
      menuScreen: MenuScreenPage(),
      borderRadius: 24.0,
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.black12,
      menuBackgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}

class MenuScreenPage extends StatelessWidget {
  const MenuScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ListTile(
            leading: CircleAvatar(
                backgroundColor: Color.fromARGB(18, 0, 0, 0),
                child: Icon(
                  Icons.home,
                  color: Colors.black,
                )),
            title: Text(
              'home',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold),
            ),
          ),
          ExpansionTile(
              // shape: Border(),
              leading: const CircleAvatar(
                  backgroundColor: Color.fromARGB(18, 0, 0, 0),
                  child: Icon(
                    Icons.language,
                    color: Colors.black,
                  )),
              title: const Text(
                'language',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold),
              ),
              children: [
                GestureDetector(
                  onTap: (){},
                  child: const ListTile(

                    //  leading:  Icon(Icons.language,color: Colors.black,),
                    title: Text(
                      'Hindi',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: const ListTile(
                    //  leading:  Icon(Icons.language,color: Colors.black,),
                    title: Text(
                      'English',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const ListTile(
                  //  leading:  Icon(Icons.language,color: Colors.black,),
                  title: Text(
                    'Arabic',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),

        ],
      ),
    );
  }
}

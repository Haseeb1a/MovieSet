import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:movieset/view/home_page.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return  ZoomDrawer(
      mainScreen:HomePage() ,
      menuScreen:MenuScreenPage() ,
      borderRadius: 24.0,
      showShadow: true,
      drawerShadowsBackgroundColor: Colors.black12,
      menuBackgroundColor: Colors.white,


      
    );
  }

}
class MenuScreenPage extends StatelessWidget {
  const MenuScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ListTile(
          leading:  Icon(Icons.home,color: Colors.black,),
       title: Text('home',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
        ),
        ListTile(
          leading:  Icon(Icons.language,color: Colors.black,),
       title: Text('language',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
        )
    
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movieset/controller/details_controller.dart';
import 'package:movieset/controller/home_controller.dart';
import 'package:movieset/controller/locaization.dart';
import 'package:movieset/controller/splace_controllers.dart';
import 'package:movieset/l10n/l10.n.dart';
import 'package:movieset/view/drawer_page/darawer_page.dart';
import 'package:movieset/view/home_page/home_page.dart';
import 'package:movieset/view/splace_screen/splace_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
  MultiProvider(
    
      providers: [
        ChangeNotifierProvider(create: (context) => HomepageController()),
        ChangeNotifierProvider(create: (context) => DatailsController()),
        ChangeNotifierProvider(create: (context) => SplaceController()),
         ChangeNotifierProvider(create: (context) => LocilizationController())
      ],
      child:   MyApp(
    
  ),)
 );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         supportedLocales:L10n.all,
        
          locale:Provider.of<LocilizationController>(context).locale,
     localizationsDelegates: const [
     
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  SplaceScreen(),
    );
  }
}


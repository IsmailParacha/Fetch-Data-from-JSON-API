import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_global/CheckBox/CheckBox.dart';
import 'package:ms_global/DailogBox/DailogBox.dart';
import 'package:ms_global/DropDown%20Menu/DropDownMenu.dart';
import 'package:ms_global/ExpansionTile/Expansiontile.dart';
import 'package:ms_global/Get%20State/Routes/mainPage.dart';
import 'package:ms_global/Grid%20view/grid.dart';
import 'package:ms_global/View/home.dart';
import 'package:ms_global/infiniteScrolling/ScrollingPage.dart';

import 'Bottom Sheet/Bottom sheet.dart';

void main() {
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: DropDownExample(),
      // home: Scaffold(
      //   // body: Property(),
      //   body: Center(
      //       child: AnimatedSplashScreen(
      //     duration: 1500,
      //     splashTransition: SplashTransition.slideTransition,
      //     splashIconSize: 400,
      //     splash: Container(
      //       decoration: const BoxDecoration(
      //           image: DecorationImage(
      //         image: AssetImage('images/splash.jpeg'),
      //       )),
      //     ),
      // nextScreen: mainPage(),

      // )),
      // ),
    );
  }
}

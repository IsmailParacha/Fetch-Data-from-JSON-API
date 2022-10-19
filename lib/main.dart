import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_global/View/home.dart';
import 'package:ms_global/infiniteScrolling/ScrollingPage.dart';

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
    return GetMaterialApp(
      scaffoldMessengerKey: messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: Property(),
        body: Center(
            child: AnimatedSplashScreen(
          duration: 1500,
          splashTransition: SplashTransition.slideTransition,
          splashIconSize: 400,
          splash: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/splash.jpeg'),
            )),
          ),
          nextScreen: Home(),
        )),
      ),
    );
  }
}

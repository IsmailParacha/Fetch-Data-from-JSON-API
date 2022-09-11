import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ms_global/View/login.dart';

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
    return MaterialApp(
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
          nextScreen: Login(),
        )),
      ),
    );
  }
}

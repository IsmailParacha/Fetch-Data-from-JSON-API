import 'package:flutter/material.dart';
import 'package:ms_global/Text%20Editor/TextEditor.dart';

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
      home: const TextEditor(),
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

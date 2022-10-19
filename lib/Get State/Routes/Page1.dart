import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ms_global/Get%20State/Routes/Page3.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Page1"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () =>
                  Get.offAll(Page3()), //not option tog go back screens
              child: Text("GOTO Page 3"),
              color: Color.fromARGB(255, 133, 132, 127),
            ),
            SizedBox(height: 10),
            MaterialButton(
              onPressed: () => Get.back(), //goto previouse screen
              child: Text("Back to previous screen"),
              color: Colors.amberAccent,
            )
          ],
        )));
  }
}

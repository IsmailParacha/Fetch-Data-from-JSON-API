import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ms_global/Get%20State/Routes/Page1.dart';
import 'package:ms_global/Get%20State/Routes/Page2.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                Get.to(Page1()); //go to page1 by calling class
              },
              child: Text("Page1"),
              color: Colors.amberAccent,
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                Get.off(Page2()); //can't go back
              },
              child: Text("Page2"),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

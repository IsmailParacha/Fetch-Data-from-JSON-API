import 'package:flutter/material.dart';
import 'package:ms_global/View/AllPost.dart';
import 'package:get/get.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 222, 43, 43),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          title: Text("Lorem Ipsum"),
          bottom: TabBar(tabs: [Tab(text: "ALL POST"), Tab(text: "PROFILE")]),
        ),
        body: TabBarView(children: [AllPost(), Text("Text2")]),
      ),
    );
  }
}

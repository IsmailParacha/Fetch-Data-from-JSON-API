// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../View/AllPost.dart';
import '../infiniteScrolling/ActivityList.dart';

// ignore: prefer_typing_uninitialized_variables
var username;
// ignore: prefer_typing_uninitialized_variables
var password;
bool hasMore = true;

class GridExample extends StatefulWidget {
  const GridExample({super.key});

  @override
  State<GridExample> createState() => _GridExampleState();
}

class _GridExampleState extends State<GridExample> {
  int pageNo = 0;
  late ScrollController controller;
  List<VisitLogList>? visitList1;
  List<VisitLogList>? visitList2;
  @override
  void initState() {
    super.initState();
    // visitList1();
    fetchingInitialData();
    controller = ScrollController();

    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        setState(() {
          pageNo++;
          MoreData(pageNo);
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // ignore: non_constant_identifier_names
  Future MoreData(pageNo) async {
    var response = await http.post(
      Uri.parse('https://uat.ibdaafintech.com/AKMHRM/services/activity/list'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "$username:$password",
      },
      body: jsonEncode({
        "startIndex": pageNo,
      }),
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      ActivityList activityList = ActivityList.fromJson(responseJson);
      if (mounted) {
        setState(() {
          visitList2 = activityList.visitLogList;
          visitList1 = (visitList1! + visitList2!);
          if (pageNo > 0) {
            if (visitList2!.isEmpty) {
              hasMore = false;
            } else {
              hasMore = true;
            }
          }
        });
      }
    }
  }

  Future fetchingInitialData() async {
    var response = await http.post(
      Uri.parse('https://uat.ibdaafintech.com/AKMHRM/services/activity/list'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: "ashraf:12345678",
      },
      body: jsonEncode({
        "startIndex": pageNo,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      ActivityList activityList = ActivityList.fromJson(responseJson);
      if (mounted) {
        setState(() {
          visitList1 = activityList.visitLogList;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Grid View")),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
          children: List.generate(visitList1!.length, (index) {
            return list(
              (visitList1?[index].employeeProfileByAssignedById?.firstName),
              (visitList1?[index].employeeProfileByAssignedById?.lastName),
            );
          }),
        ));
  }

  Widget list(var fname, var lname) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blueAccent,
        child: Center(
          child: Text(
            "$fname $lname",
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Model/PostModel.dart';

class AllPost extends StatefulWidget {
  const AllPost({Key? key}) : super(key: key);

  @override
  State<AllPost> createState() => _AllPostState();
}

class _AllPostState extends State<AllPost> {
  late Future _futuremember;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futuremember = getmembers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            FutureBuilder(
                future: _futuremember,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data == null) {
                    print("obj:null data ${snapshot.data}");
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text("No DATA"),
                        )
                      ],
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text("${snapshot.data[index].title}",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text("${snapshot.data[index].body}"),
                            ),
                            Divider(
                              thickness: 1.0,
                            )
                          ],
                        );
                      },
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

Widget list(var title, var body) {
  return Column(
    children: [Text(title), Text(body)],
  );
}

getmembers() async {
  try {
    var response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );
    var responseJson = jsonDecode(response.body);
    List<Calldata> calldatascreen = [];
    for (var i = 0; i < responseJson.length; i++) {
      Calldata services = Calldata(
          userId: responseJson[i]['userId'],
          id: responseJson[i]['id'],
          title: responseJson[i]['title'],
          body: responseJson[i]['body']);
      calldatascreen.add(services);
    }
    return calldatascreen;
  } catch (e) {
    print("error:$e");
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllPost extends StatefulWidget {
  const AllPost({Key? key}) : super(key: key);

  @override
  State<AllPost> createState() => _AllPostState();
}

class _AllPostState extends State<AllPost> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    POST();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 5, right: 5),
          child: [0].applicationType?.name == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      controller: controller,
                      itemCount: visitList!.length + 1,
                      itemBuilder: (
                        BuildContext context,
                        int index,
                      ) {
                        if (index == visitList!.length) {
                          return ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(),
                              ],
                            ),
                          );
                        } else {
                          return list(
                            (visitList?[index]
                                .employeeProfileByAssignedById
                                ?.firstName),
                            (visitList?[index]
                                .employeeProfileByAssignedById
                                ?.lastName),
                            (visitList?[index].applicationType?.name),
                            (visitList?[index].checkInDate),
                            (visitList?[index].checkOutDate),
                            (visitList?[index].systemType?.id),
                          );
                        }
                      }),
                )),
    );
  }
}

Future<void> POST() async {
  var response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    List<dynamic> responseJson = jsonDecode(response.body);
    PostModel obj = PostModel.fromJson(responseJson[0]);
    print(obj.title);
  }
}

// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostModel {
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

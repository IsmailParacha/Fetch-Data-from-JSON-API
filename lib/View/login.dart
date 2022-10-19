// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors
import 'dart:convert';
import 'package:get/get.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ms_global/Model/LoginModel.dart';

import '../Model/LoginModel.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  List<LoginModel>? loginModel;

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              child: Image(
                  image: AssetImage('images/splash.jpeg'),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 5),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: emailcontroller,
            decoration: const InputDecoration(
              fillColor: Color.fromARGB(255, 227, 224, 224),
              filled: true,
              hintText: ' Email',
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passcontroller,
            obscureText: _isObscure,
            decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 228, 225, 225),
                filled: true,
                hintText: ' Password',
                border: InputBorder.none,
                suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    })
                // Icon(
                //   MdiIcons.eyeOff,
                // ),
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: InkWell(
              onTap: () {
                // login();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 222, 43, 43)),
                  child: const Center(
                      child: Text(
                    " LOGIN",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ))),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> login() async {
    if (passcontroller.text.isNotEmpty && emailcontroller.text.isNotEmpty) {
      var email = emailcontroller.text;
      var password = passcontroller.text;
      var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
        // headers: {
        //   // HttpHeaders.authorizationHeader: 'ashraf:12345678',
        //   HttpHeaders.authorizationHeader: '$email:$password',
        // },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final responseJson = jsonDecode(response.body);
        LoginModel userdata = LoginModel.fromJson(responseJson);
        if (mounted) {
          setState(() {
            print(userdata.email.length);
          });
        }
        if (email == userdata.email && password == userdata.username) {
          // ignore: use_build_context_synchronously
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invalid credential")));
        }
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid credential")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Blank Field Not Allowed")));
    }
  }
}

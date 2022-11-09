import 'package:flutter/material.dart';

class DailogBoxExample extends StatefulWidget {
  const DailogBoxExample({super.key});

  @override
  State<DailogBoxExample> createState() => _DailogBoxExampleState();
}

class _DailogBoxExampleState extends State<DailogBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DailogBox"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("Warning"),
                        content: Text("Warning description"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"))
                        ],
                      ));
            },
            child: Text("Open DailogBox")),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({super.key});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Open Bottom Sheet"),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    // isScrollControlled: true, //for overflowed
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    builder: (context) => Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Bottom sheet",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, height: 5),
                              ),
                              const Text(
                                "Bottom sheet",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, height: 5),
                              ),
                              const Text(
                                "Bottom sheet",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, height: 5),
                              ),
                              ElevatedButton(
                                onPressed: (() => Navigator.pop(context)),
                                child: Text("Close Bottom Sheet"),
                              )
                            ],
                          ),
                        ));
              },
              child: Text("Bottom Sheet")),
        ));
  }
}

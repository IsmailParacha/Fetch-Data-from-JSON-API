import 'package:flutter/material.dart';

class DropDownExample extends StatefulWidget {
  const DropDownExample({super.key});

  @override
  State<DropDownExample> createState() => _DropDownExampleState();
}

class _DropDownExampleState extends State<DropDownExample> {
  List<String> dropitem = ['Item 1', 'Item 2', 'item 3'];
  String? selectedItem = 'Item 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DailogBox"),
        ),
        body: Center(
          child: DropdownButton<String>(
              value: selectedItem,
              items: dropitem
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (item) => setState(() {
                    selectedItem = item;
                  })),
        ));
  }
}

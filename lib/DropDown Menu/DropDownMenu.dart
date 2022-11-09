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
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 3, color: Colors.blue))),
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
          ),
        ));
  }
}

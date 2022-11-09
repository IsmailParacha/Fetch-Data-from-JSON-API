import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckBoxEample extends StatefulWidget {
  CheckBoxEample({Key? key}) : super(key: key);

  @override
  State<CheckBoxEample> createState() => _CheckBoxEampleState();
}

class _CheckBoxEampleState extends State<CheckBoxEample> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox"),
      ),
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.red),
          child: CheckboxListTile(
            title: Text("Check requirements"),
            subtitle: Text("Checking"),
            // controlAffinity:ListTileControlAffinity.leading, //for leading checkBox
            value: isChecked,
            onChanged: (value) {
              setState(
                () {
                  isChecked = value!;
                },
              );
            },
            activeColor: Colors.red,
            checkColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

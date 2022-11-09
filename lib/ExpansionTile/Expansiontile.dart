import 'package:flutter/material.dart';

class ExpansionTileExample extends StatefulWidget {
  const ExpansionTileExample({super.key});

  @override
  State<ExpansionTileExample> createState() => _ExpansionTileExampleState();
}

class _ExpansionTileExampleState extends State<ExpansionTileExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Expension Tile"),
        ),
        body: ExpansionTile(
          title: Text("Transport"),
          children: [
            ListTile(
              title: Text(
                "Car",
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Bike",
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Bus",
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {},
            )
          ],
          onExpansionChanged: (isExpanded) {
            print("Expanded: $isExpanded");
          },
        ));
  }
}

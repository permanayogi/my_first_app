import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  static const List<String> items = [
    //create list for items
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Grapes',
  ];

  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Items'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          }),
    );
  }
}

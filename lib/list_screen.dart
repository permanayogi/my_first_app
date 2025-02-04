import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  //change stateless to stateful
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<String> items = [
    //create list for items
    'Apple',
    'Banana',
    'Orange',
    'Mango',
    'Grapes',
  ];

  void _deleteItem(int index) {
    //method for delete item
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Items'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              //swipe right to left delete item
              key: Key(items[index]),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              direction: DismissDirection
                  .endToStart, //direction to swipe (Right to left)
              onDismissed: (direction) {
                //run method on dismiss
                final deletedItem = items[index]; //store deleted item
                _deleteItem(index); //Remove item

                Future.delayed(const Duration(milliseconds: 100), () {
                  //add delay 100ms
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('$deletedItem deleted'),
                    action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          setState(() {
                            items.insert(
                                index, deletedItem); //undo deleted item
                          });
                        }),
                  ));
                });
              },
              child: ListTile(
                title: Text(items[index]),
              ),
            );
          }),
    );
  }
}

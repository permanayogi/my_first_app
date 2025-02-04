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

  final TextEditingController _textController = TextEditingController();

  void _deleteItem(int index) {
    //method for delete item
    setState(() {
      items.removeAt(index);
    });
  }

  void _addItem() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add New Item'),
            content: TextField(
              controller: _textController,
              decoration: const InputDecoration(hintText: 'Enter item name'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      items.add(_textController.text);
                    });
                    _textController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text('Add'))
            ],
          );
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
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _message = "Hello, Yogi!";

  void _changeMessage() {
    setState(() {
      _message = "Welcome to Flutter!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My First Flutter App'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text(_message, style: TextStyle(fontSize: 24),), 
            SizedBox(height: 20), 
            ElevatedButton(onPressed: _changeMessage, child: Text('Click Me')
            )
            ],
          ),
        ),
      );
    }
}
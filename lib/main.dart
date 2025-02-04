import 'package:flutter/material.dart';
import 'package:my_first_app/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      theme: ThemeData(
          primaryColor: Colors.deepPurple, //primary color
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.amber, //acccent color
          ),
          textTheme: const TextTheme(
              headlineLarge: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold), //appbar title
              bodyLarge: TextStyle(
                  fontSize: 16, color: Colors.black87) //list item text
              ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 4,
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _message = "Hello, Yogi!";

  void _changeMessage() {
    //function for changing the text or message
    setState(() {
      _message = "Welcome to Flutter!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My First Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: _changeMessage, child: const Text('Click Me')),
            ElevatedButton(
              //Button for list screen view
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListScreen()));
              },
              child: const Text('Go to List Screen'),
            )
          ],
        ),
      ),
    );
  }
}

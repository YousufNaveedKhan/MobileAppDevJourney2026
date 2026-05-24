import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Hello World",
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                print("Button Pressed");
              },
              child: Text("Submit"),
            ),

            OutlinedButton(
              onPressed: () {
                print("Outlined Button Pressed");
              },
              child: Text("Submit"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );
              },
              child: Text("Next Screen"),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.person_2)),
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Prev Screen"),
        ),
      ),
    );
  }
}

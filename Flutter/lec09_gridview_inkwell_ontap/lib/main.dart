import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Color> clrs = [
    Colors.teal,
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.brown,
    Colors.purple,
    Colors.indigo,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: clrs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print("Item index no is: ${index}");

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Item index no is: ${index}"),)
              );
            },
            child: Container(color: clrs[index])
          );

        },
      ),
    );
  }
}

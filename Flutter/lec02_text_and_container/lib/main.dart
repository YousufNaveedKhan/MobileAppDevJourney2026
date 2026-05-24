import 'package:flutter/material.dart';

void main() {
  runApp(const LecTwo());
}

class LecTwo extends StatelessWidget {
  const LecTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red, 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Text("Text 1"),
                Text("Text 1"),
                Text("Text 1"),
                Text("Text 1"),
                Text("Text 1"),
                Text("Text 1"),
              ],
            ), 
          ),
        )
      )
    );
  }
}
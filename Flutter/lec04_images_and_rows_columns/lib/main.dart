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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome"), 
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Login Form"),
                  SizedBox(width: 20,),
                  Text("Data"),
              
                  Image.network("https://cdn-icons-png.flaticon.com/512/6596/6596121.png", height: 150, width: 150,), 
                  SizedBox(width: 10,), 
                  Image.asset("images/user.png", height: 150, width: 150),
                ],
              ),
            ],
          ),
        )
        ,)
    );
  }
}

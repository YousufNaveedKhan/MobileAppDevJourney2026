import 'package:flutter/material.dart';
import 'package:lec15_custom_widget/custom_button.dart';
import 'package:lec15_custom_widget/user_card.dart';

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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: "Login",
              onPressed: () {
                print("Button Clicked");
              },
            ),
            SizedBox(height: 10,), 
            UserCard(color: Colors.white, name: "Aptech", email: "apt@gmail.com", userIcon: Icon(Icons.person))
          ],
        ),
      ),
    );
  }
}

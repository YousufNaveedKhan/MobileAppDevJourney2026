import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginSCR());
  }
}

class LoginSCR extends StatefulWidget {
  const LoginSCR({super.key});

  @override
  State<LoginSCR> createState() => _LoginSCRState();
}

class _LoginSCRState extends State<LoginSCR> {
  final TextEditingController userEmail = TextEditingController();
  final TextEditingController userPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: userEmail),
            Container(height: 10),
            TextField(controller: userPass),
            Container(height: 10),
            ElevatedButton(
              onPressed: () async {
                String email = userEmail.text.toString();
                String pass = userPass.text;

                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();

                sharedPreferences.setBool("isLogin", true);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
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
    return Scaffold(body: Text("Welcome"));
  }
}

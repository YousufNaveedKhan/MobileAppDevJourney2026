import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, dynamic>> chatList = [
    {"name": "Samar", "message": "Hello World...", "lastMsg": "5:00 AM"},
    {"name": "Aneesa", "message": "Hello World...", "lastMsg": "6:00 AM"},
    {"name": "Sajida", "message": "Hello World...", "lastMsg": "7:00 AM"},
    {
      "name": "Muhammad bin Qasim",
      "message": "Hello World...",
      "lastMsg": "8:00 AM",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ChatApp")),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];

          return ListTile(
            title: Text(chat["name"]),
            subtitle: Text(chat["message"]),
            trailing: Text(chat["lastMsg"]),
          );
        },
      ),
    );
  }
}

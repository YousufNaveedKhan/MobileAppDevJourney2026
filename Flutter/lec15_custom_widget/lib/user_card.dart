import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final Color color;
  final String name;
  final String email;
  final Icon userIcon;
  UserCard({
    super.key,
    required this.color,
    required this.name,
    required this.email,
    required this.userIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(name),
        subtitle: Text(email),
        trailing: userIcon,
      ),
    );
  }
}

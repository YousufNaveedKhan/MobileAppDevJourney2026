import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              DateTime? datepicker = await showDatePicker(
                context: context,
                firstDate: DateTime(2001),
                lastDate: DateTime(2030),
              );

              if (datepicker != null) {
                print("Selected ${datepicker.day}");
              }
            },
            child: Text("Date Picker"),
          ),
          SizedBox(height: 10),
          Divider(),
          ElevatedButton(
            onPressed: () async {
              TimeOfDay? timepicker = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (timepicker != null) {
                print("Selected ${timepicker.hour}");
              }
            },
            child: Text("Time Picker"),
          ),
        ],
      ),
    );
  }
}

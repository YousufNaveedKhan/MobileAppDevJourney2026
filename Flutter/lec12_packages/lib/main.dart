import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SurahScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset('images/quran.png'),
      ),
      backgroundColor: Colors.brown[900],
    );
  }
}

class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: quran.totalSurahCount,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailSurah(index + 1)),
              );
            },
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(
              quran.getSurahName(index + 1) +
                  " | " +
                  quran.getSurahNameArabic(index + 1),
              style: GoogleFonts.amiriQuran(),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                quran.getPlaceOfRevelation(index + 1) == "Makkah"
                    ? Image.asset('images/kaaba.png', height: 30, width: 30)
                    : Image.asset('images/madina.png', height: 30, width: 30),
                Text("Verses: " + quran.getVerseCount(index + 1).toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}

class DetailSurah extends StatefulWidget {
  var index;
  DetailSurah(this.index, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: quran.getVerseCount(widget.index),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              quran.getVerse(widget.index, index + 1, verseEndSymbol: true), style: GoogleFonts.amiriQuran(), textAlign: TextAlign.right,
            )
          );
        },
      ),
    );
  }
}

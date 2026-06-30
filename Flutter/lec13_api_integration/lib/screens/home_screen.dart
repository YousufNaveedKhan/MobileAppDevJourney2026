import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'surah_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List surahs = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchSurahs();
  }

  fetchSurahs() async {
    try {
      // Secure URL (https)
      final response = await http.get(
        Uri.parse("https://api.alquran.cloud/v1/surah"),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          surahs = data['data'];
          loading = false;
        });
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      setState(() => loading = false);
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quran App", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: surahs.length,
              separatorBuilder: (context, index) => Divider(height: 1),
              itemBuilder: (context, index) {
                final surah = surahs[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.shade100,
                    child: Text(surah['number'].toString(), style: TextStyle(color: Colors.green)),
                  ),
                  title: Text(surah['englishName'], style: GoogleFonts.poppins()),
                  subtitle: Text(surah['name'], style: GoogleFonts.amiriQuran()),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SurahScreen(
                          surahNumber: surah['number'],
                          surahName: surah['englishName'], 
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
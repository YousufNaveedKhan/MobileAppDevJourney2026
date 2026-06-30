import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class SurahScreen extends StatefulWidget {
  final int surahNumber;
  final String surahName;
  SurahScreen({required this.surahNumber, required this.surahName});

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  List ayahs = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchAyahs();
  }

  fetchAyahs() async {
    try {
      final ayahResponse = await http.get(
        Uri.parse(
          "https://api.alquran.cloud/v1/surah/${widget.surahNumber}/quran-uthmani",
        ),
      );

      final engResponse = await http.get(
        Uri.parse(
          "https://api.alquran.cloud/v1/surah/${widget.surahNumber}/en.asad",
        ),
      );

      if (ayahResponse.statusCode == 200 && engResponse.statusCode == 200) {
        final data = json.decode(ayahResponse.body)['data']['ayahs'];
        final engData = json.decode(engResponse.body)['data']['ayahs'];

        List combinedAyahs = [];

        for (int i = 0; i < data.length; i++) {
          combinedAyahs.add({
            'numberInSurah': data[i]['numberInSurah'],
            'arabic': data[i]['text'],
            'translation': engData[i]['text'],
          });
        }

        setState(() {
          ayahs = combinedAyahs;
          loading = false;
        });
      } else {
        setState(() => loading = false);
        print("Failed to fetch ayahs");
      }
    } catch (e) {
      setState(() => loading = false);
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.surahName)),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: ayahs.length,
              itemBuilder: (context, index) {
                final ayah = ayahs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 16,
                            child: Text("${ayah['numberInSurah']}", style: TextStyle(fontSize: 12)),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              ayah['arabic'],
                              style: GoogleFonts.amiriQuran(fontSize: 24),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        ayah['translation'],
                        style: TextStyle(fontSize: 16),
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
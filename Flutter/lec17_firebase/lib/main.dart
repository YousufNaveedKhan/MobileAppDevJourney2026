import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'services/firestore_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Service instance
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController noteCtrl = TextEditingController();

  void openNoteBox({String? docID, String? existingText}) {
    // Agr edit krrhe hain tou purana text field mein dikhao
    if (existingText != null) {
      noteCtrl.text = existingText;
    } else {
      noteCtrl.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(docID == null ? "Add Note" : "Update Note"),
        content: TextField(
          controller: noteCtrl,
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter your note..."),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                firestoreService.addNote(noteCtrl.text);
              } else {
                firestoreService.updateNote(docID, noteCtrl.text);
              }

              noteCtrl.clear();
              Navigator.pop(context);
            },
            child: Text(docID == null ? "Add" : "Update"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firestore CRUD"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openNoteBox(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List notesList = snapshot.data!.docs;

            return ListView.builder(
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = notesList[index];
                String docID = document.id;

                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'] ?? '';

                return ListTile(
                  title: Text(noteText),
                  subtitle: const Text("Tap edit to update"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () =>
                            openNoteBox(docID: docID, existingText: noteText),
                        icon: const Icon(Icons.edit, color: Colors.blue),
                      ),
                      IconButton(
                        onPressed: () => firestoreService.deleteNote(docID),
                        icon: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No notes found..."));
          }
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:note_app/screens/notes_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Notes",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.white),
            ),
          ],
          backgroundColor: Colors.deepPurple.shade300,
        ),
        body: NotesScreen(),
      ),
    );
  }
}

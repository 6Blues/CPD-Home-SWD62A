import 'package:flutter/material.dart';
import 'package:note_app/data/dummy_notes.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, //num of columns
        childAspectRatio: 3 / 2, //width / height ratio
        crossAxisSpacing: 20, // spacing between columns
        mainAxisSpacing: 20, // spacing between rows
      ),
      children: [for (final note in dummyNotes) Text(note.title)],
    );
    ;
  }
}

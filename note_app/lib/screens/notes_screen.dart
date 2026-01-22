import 'package:flutter/material.dart';
import 'package:note_app/data/dummy_notes.dart';
import 'package:note_app/widgets/note_card.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  for (int i = 0; i < dummyNotes.length; i += 2)
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: NoteCard(note: dummyNotes[i]),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                children: [
                  for (int i = 1; i < dummyNotes.length; i += 2)
                    Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 10),
                      child: NoteCard(note: dummyNotes[i]),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

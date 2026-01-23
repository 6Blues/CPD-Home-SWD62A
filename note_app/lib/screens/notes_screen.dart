import 'package:flutter/material.dart';
import 'package:note_app/data/dummy_notes.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/screens/view_note_screen.dart';
import 'package:note_app/widgets/add_note.dart';
import 'package:note_app/widgets/note_card.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotesScreenState();
  }
}

class _NotesScreenState extends State<NotesScreen> {
  void _openAddNoteOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => AddNoteScreen(saveNote: addNote),
    );
  }

  void addNote(Note n) {
    if (n.title != "" || n.content != "") {
      setState(() {
        dummyNotes.add(n);
      });
    }
  }

  void viewNote(Note note) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => ViewNoteScreen(note: note)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Notes",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _openAddNoteOverlay,
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: SingleChildScrollView(
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
                        child: NoteCard(
                          note: dummyNotes[i],
                          onSelectedNote: viewNote,
                        ),
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
                        child: NoteCard(
                          note: dummyNotes[i],
                          onSelectedNote: viewNote,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

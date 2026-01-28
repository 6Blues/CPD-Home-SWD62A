import 'package:flutter/material.dart';
// import 'package:note_app/data/dummy_notes.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/screens/view_note_screen.dart';
import 'package:note_app/services/hive_service.dart';
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
        HiveService.addNote(n);
        notes = HiveService.getNotes();
      });
    }
  }

  void viewNote(Note note) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => ViewNoteScreen(note: note)));
  }

  var notes = HiveService.getNotes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Notes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Semantics(
            label: "Add Note",
            button: true,
            child: IconButton(
              onPressed: _openAddNoteOverlay,
              icon: Icon(Icons.add, color: Colors.white),
            ),
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
                    for (int i = 0; i < notes.length; i += 2)
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: NoteCard(
                          note: notes[i],
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
                    for (int i = 1; i < notes.length; i += 2)
                      Padding(
                        padding: const EdgeInsets.only(right: 10, bottom: 10),
                        child: NoteCard(
                          note: notes[i],
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

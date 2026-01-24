import 'dart:io';

import 'package:flutter/material.dart';
import 'package:note_app/data/notes_colours.dart';
import 'package:note_app/models/note.dart';

// ignore: must_be_immutable
class NoteCard extends StatelessWidget {
  NoteCard({super.key, required this.note, required this.onSelectedNote});

  Note note;
  final void Function(Note) onSelectedNote;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: noteColors[note.colours].bgColor,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: () {
          onSelectedNote(note);
        },
        borderRadius: BorderRadius.circular(5),
        splashColor: noteColors[note.colours].bgColor,
        child: Ink(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        note.title,
                        style: TextStyle(
                          color: noteColors[note.colours].txtColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),

              if (note.imagePath != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Image.file(
                    File(note.imagePath!),
                    width: double.infinity,
                    height: 160,
                    fit: BoxFit.contain,
                  ),
                ),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      note.content,
                      style: TextStyle(
                        color: noteColors[note.colours].txtColor,
                        fontSize: 15,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

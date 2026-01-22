import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

// ignore: must_be_immutable
class NoteCard extends StatelessWidget {
  NoteCard({super.key, required this.note});

  Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: note.bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  note.title,
                  style: TextStyle(
                    color: note.txtColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  note.content,
                  style: TextStyle(color: note.txtColor, fontSize: 15),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

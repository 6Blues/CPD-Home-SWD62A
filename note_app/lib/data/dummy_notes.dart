import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

const dummyNotes = [
  Note(title: "Hello", content: "This is some content"),
  Note(
    title: "Note Header",
    content: "I am able to write a note! YIPIEE!",
    color: Colors.lightGreen,
  ),
  Note(
    title: "Shopping List",
    content: "- Milk\n- Bread\n- Eggs\n- Coffee",
    color: Colors.amber,
  ),
  Note(
    title: "Reminder",
    content: "Finish the Flutter assignment before Friday.",
  ),
  Note(
    title: "Ideas",
    content: "• Notes app\n• Weather app\n• Simple game",
    color: Colors.lightBlueAccent,
  ),
  Note(
    title: "Quote",
    content: "“Code is like humor. When you have to explain it, it's bad.”",
  ),
  Note(
    title: "Meeting Notes",
    content: "Discuss UI improvements and bug fixes.",
    color: Colors.teal,
  ),
  Note(
    title: "Daily Journal",
    content: "Learned about widgets and state management today.",
    color: Colors.orangeAccent,
  ),
];

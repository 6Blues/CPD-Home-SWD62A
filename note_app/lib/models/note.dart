import 'package:flutter/material.dart';

class Note {
  const Note({this.title = "", this.content = "", this.color = Colors.grey});

  final String title;
  final String content;
  final Color color;
}

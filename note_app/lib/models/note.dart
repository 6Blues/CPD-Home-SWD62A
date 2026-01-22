import 'package:flutter/material.dart';

class Note {
  const Note({
    this.title = "",
    this.content = "",
    this.bgColor = Colors.grey,
    this.txtColor = Colors.black,
  });

  final String title;
  final String content;
  final Color bgColor;
  final Color txtColor;
}

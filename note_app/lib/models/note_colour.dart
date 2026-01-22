import 'package:flutter/widgets.dart';

class NoteColour {
  const NoteColour({
    this.bgColor = const Color.fromRGBO(224, 224, 224, 1),
    this.txtColor = const Color.fromRGBO(33, 33, 33, 1),
  });

  final Color bgColor;
  final Color txtColor;
}

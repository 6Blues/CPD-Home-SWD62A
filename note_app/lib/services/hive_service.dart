import 'package:hive/hive.dart';
import 'package:note_app/models/note.dart';

class HiveService {
  static Box get notesBox => Hive.box("Notes");

  static List<Note> getNotes() {
    return notesBox.values.map((data) {
      final map = data as Map;

      return Note(
        title: map["title"] ?? "",
        content: map["content"] ?? "",
        imagePath: map["imagePath"],
        colours: map["colours"] ?? 0,
      );
    }).toList();
  }

  static addNote(Note note) {
    notesBox.add({
      "title": note.title,
      "content": note.content,
      "imagePath": note.imagePath,
      "colours": note.colours,
    });
  }
}

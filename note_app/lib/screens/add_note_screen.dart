import 'package:flutter/material.dart';
import 'package:note_app/data/notes_colours.dart';
import 'package:note_app/models/note.dart';

class AddNoteScreen extends StatefulWidget {
  final void Function(Note) saveNote;
  const AddNoteScreen({super.key, required this.saveNote});

  @override
  State<StatefulWidget> createState() {
    return _AddNoteScreenState();
  }
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  int _selectedColourIndex = 0;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    addNote(Note note) {
      widget.saveNote(note);
      Navigator.pop(context);
    }

    return Container(
      decoration: BoxDecoration(
        color: noteColors[_selectedColourIndex].bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Title",
                  style: TextStyle(
                    color: noteColors[_selectedColourIndex].txtColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              style: TextStyle(
                color: noteColors[_selectedColourIndex].txtColor,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _contentController,
              maxLines: 10,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text(
                  "Content",
                  style: TextStyle(
                    color: noteColors[_selectedColourIndex].txtColor,
                  ),
                ),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              style: TextStyle(
                color: noteColors[_selectedColourIndex].txtColor,
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Text(
                  'Note colour',
                  style: TextStyle(
                    color: noteColors[_selectedColourIndex].txtColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Wrap(
                  spacing: 10,
                  children: [
                    for (int i = 0; i < noteColors.length; i++)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColourIndex = i;
                          });
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: noteColors[i].bgColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _selectedColourIndex == i
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                Spacer(),

                ElevatedButton(
                  onPressed: () {
                    addNote(
                      Note(
                        title: _titleController.text,
                        content: _contentController.text,
                        colours: _selectedColourIndex,
                      ),
                    );
                  },
                  child: const Text('Save Note'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

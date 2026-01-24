class Note {
  const Note({
    this.title = "",
    this.content = "",
    this.imagePath,
    this.colours = 0,
  });

  final String title;
  final String content;
  final String? imagePath;
  final int colours;
}

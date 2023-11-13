class NoteModel {
  String title, description;
  bool isDone;
  DateTime noteDate;
  int priority;

  NoteModel({
    required this.title,
    required this.description,
    required this.isDone,
    required this.noteDate,
    required this.priority,
  });

}

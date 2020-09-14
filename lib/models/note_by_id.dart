class Note{
  String noteId;
  String noteTitle;
  String noteContent;
  DateTime createdDateTime;
  DateTime lastEditedDateTime;

  Note({
    this.noteId,
    this.createdDateTime,
    this.lastEditedDateTime,
    this.noteTitle,
    this.noteContent
  });

  factory Note.fromjson(Map<String,dynamic> item ){
    return Note(
        noteId: item['noteID'],
        noteContent: item['noteContent'],
        noteTitle: item['noteTitle'],
        createdDateTime: DateTime.parse(item['createDateTime']),
        lastEditedDateTime: item['latestEditDateTime'] != null ? DateTime.parse(item['latestEditDateTime']):null
    );
  }

}
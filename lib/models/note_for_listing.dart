// import 'package:notes_app/models/note_by_id.dart';

class NoteForListing{
  String noteId;
  String noteTitle;
  DateTime createdDateTime;
  DateTime lastEditedDateTime;

  NoteForListing({
    this.noteId,
    this.noteTitle,
    this.createdDateTime,
    this.lastEditedDateTime
  });

  factory NoteForListing.fromjson(Map<String,dynamic> item ){
    return NoteForListing(
        noteId: item['noteID'],
        noteTitle: item['noteTitle'],
        createdDateTime: DateTime.parse(item['createDateTime']),
        lastEditedDateTime: item['latestEditDateTime'] != null ? DateTime.parse(item['latestEditDateTime']):null
    );
  }

}
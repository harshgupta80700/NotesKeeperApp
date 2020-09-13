import 'package:notes_app/models/note_for_listing.dart';

class NotesServices{

  List<NoteForListing> getNotelist(){

    return [
      new NoteForListing(
          noteId: "1",
          noteTitle: "Note 1",
          createdDateTime: DateTime.now(),
          lastEditedDateTime: DateTime.now()
      ),
      new NoteForListing(
          noteId: "2",
          noteTitle: "Note 2",
          createdDateTime: DateTime.now(),
          lastEditedDateTime: DateTime.now()
      ),
      new NoteForListing(
          noteId: "3",
          noteTitle: "Note 3",
          createdDateTime: DateTime.now(),
          lastEditedDateTime: DateTime.now()
      )
    ];

  }

}
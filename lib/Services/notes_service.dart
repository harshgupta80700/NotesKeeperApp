import 'dart:convert';

import 'package:notes_app/models/api_response.dart';
import 'package:notes_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesServices{

  static const url = 'http://api.notes.programmingaddict.com';
  static const headers = {
    'apiKey': '7dcad8fe-bb7a-41d7-8c47-84c1d2bcd68b'
  };

  Future<APIResponse<List<NoteForListing>>> getNotelist(){
    return http.get(url + '/notes',headers: headers).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData){
          final note = NoteForListing(
            noteId: item['noteID'],
            noteTitle: item['noteTitle'],
            createdDateTime: DateTime.parse(item['createDateTime']),
            lastEditedDateTime: item['latestEditDateTime'] != null ? DateTime.parse(item['latestEditDateTime']):null
          );
          notes.add(note);
        }
        print(notes.length);
        return APIResponse<List<NoteForListing>>(
          data: notes
        );
      }
      return APIResponse<List<NoteForListing>>(
        error: true,
        errorMessage: "An error occured"
      );
    }).catchError((_)=>APIResponse<List<NoteForListing>>(
      error: true,
      errorMessage: "An error has occured"
    ));

  }

}
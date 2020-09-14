import 'dart:convert';

import 'package:notes_app/models/api_response.dart';
import 'package:notes_app/models/note_by_id.dart';
import 'package:notes_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/notes_insert.dart';

class NotesServices{

  static const url = 'http://api.notes.programmingaddict.com';
  static const headers = {
    'apiKey': '82ae8b4f-08d3-45c2-b765-3c7d1c815674'
  };

  Future<APIResponse<List<NoteForListing>>> getNotelist(){
    return http.get(url + '/notes',headers: headers).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData){
          notes.add(NoteForListing.fromjson(item));
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


  Future<APIResponse<Note>> getNote (String noteId){
    return http.get(url + '/notes/' + noteId,headers: headers).then((data){
      if(data.statusCode == 200){
        final jsonData = json.decode(data.body);
          final note = Note.fromjson(jsonData);
        return APIResponse<Note>(
            data: note
        );
      }
      return APIResponse<Note>(
          error: true,
          errorMessage: "An error occured"
      );
    }).catchError((_)=>APIResponse<Note>(
        error: true,
        errorMessage: "An error has occured"
    ));

  }


  Future<APIResponse<bool>> createNote (NoteInsert noteInsert){
    return http.post(url + '/notes/',headers: headers,body: noteInsert.toJson()).then((data){
      if(data.statusCode == 201){
        // final jsonData = json.decode(data.body);
        // final note = Note.fromjson(jsonData);
        return APIResponse<Note>(
            data: true
        );
      }
      return APIResponse<Note>(
          error: true,
          errorMessage: "An error occured"
      );
    }).catchError((_)=>APIResponse<Note>(
        error: true,
        errorMessage: "An error has occured"
    ));

  }

}
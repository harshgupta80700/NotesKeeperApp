import 'dart:convert';

import 'package:notes_app/models/api_response.dart';
import 'package:notes_app/models/note_by_id.dart';
import 'package:notes_app/models/note_for_listing.dart';
import 'package:http/http.dart' as http;
import 'package:notes_app/models/notes_insert.dart';

class NotesServices{

  static const url = 'http://api.notes.programmingaddict.com';
  static const headers = {
    'apiKey': '82ae8b4f-08d3-45c2-b765-3c7d1c815674',
    "Content-Type": "application/json"
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
      throw Error();
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
      throw Error();
    }).catchError((_)=>APIResponse<Note>(
        error: true,
        errorMessage: "An error has occured"
    ));

  }


  Future<APIResponse<bool>> createNote (NoteManipualtion noteInsert){
    return http.post(url + '/notes',headers: headers,body: jsonEncode(noteInsert.toJson())).then((data){
      if(data.statusCode == 201){
        // final jsonData = json.decode(data.body);
        // final note = Note.fromjson(jsonData);
        return APIResponse<bool>(
            data: true
        );
      }
      throw Error();
    }).catchError((_)=>APIResponse<bool>(
        error: true,
        errorMessage: "An error has occured"
    ));

  }


  Future<APIResponse<bool>> updateNote (String noteId , NoteManipualtion noteInsert){
    return http.put(url + '/notes/' + noteId,headers: headers,body: jsonEncode(noteInsert.toJson())).then((data){
      print(data.statusCode);
      if(data.statusCode == 204){
        // final jsonData = json.decode(data.body);
        // final note = Note.fromjson(jsonData);
        return APIResponse<bool>(
            data: true
        );
      }
      throw Error();
    }).catchError((_)=>APIResponse<bool>(
        error: true,
        errorMessage: "An error has occured"
    ));

  }


}
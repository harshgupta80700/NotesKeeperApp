import 'package:flutter/cupertino.dart';

class NoteManipualtion{
  String noteTitle;
  String noteContent;

  NoteManipualtion({
    @required this.noteContent,
    @required this.noteTitle
  });

  Map<String,dynamic> toJson(){
    return {
      "noteTitle": noteTitle,
      "noteContent": noteContent
    };
  }

}
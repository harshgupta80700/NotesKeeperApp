import 'package:flutter/material.dart';
import 'package:notes_app/views/NoteList.dart';
import 'package:notes_app/views/note_modify.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> NoteList());
        break;

      case '/NoteModify':
        if(args is String){
          return MaterialPageRoute(builder: (_)=>NoteModify(noteId: args,));
        }
        break;

      default:
        return _errorRoute();
    }

  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
      builder: (_)=>Scaffold(
        appBar: AppBar(
          title: Text('ERROR'),
        ),
      )
    );
  }

}
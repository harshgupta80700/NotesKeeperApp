import 'package:flutter/material.dart';
import 'package:notes_app/views/NoteList.dart';
import 'package:notes_app/views/note_modify.dart';

Map<String , WidgetBuilder> routes = {
  "/":(context) => NoteList(),
  "/NoteModify": (context) => NoteModify()
};
import 'package:flutter/material.dart';
// import 'package:notes_app/routes/routes.dart';
import 'package:notes_app/routes/routesgenerator.dart';
import 'package:notes_app/views/NoteList.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // routes: routes,
      // initialRoute: "/",
      //onGenerateRoute: RouteGenerator.generateRoute,
      home: NoteList(),
    );
  }
}

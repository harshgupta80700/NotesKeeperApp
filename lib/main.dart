import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_app/Services/notes_service.dart';
// import 'package:notes_app/routes/routes.dart';
// import 'package:notes_app/routes/routesgenerator.dart';
import 'package:notes_app/views/NoteList.dart';

void setupLocator(){
  GetIt.instance.registerLazySingleton(() => NotesServices());
  // GetIt.instance<NotesServices>();
}


void main (){
  setupLocator();
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

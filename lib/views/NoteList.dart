import 'package:flutter/material.dart';
import 'package:notes_app/models/note_for_listing.dart';


final notes = [
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

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  String formatDateTime (DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    super.initState();
    print("notes page called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes List"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){

          },
          child: Icon(Icons.add),
      ),

      body: ListView.separated(
          itemBuilder: (_,index){
            return ListTile(
              title: Text(notes[index].noteTitle,style: TextStyle(color: Theme.of(context).primaryColor),),
              subtitle: Text("Last edited on ${formatDateTime(notes[index].lastEditedDateTime)}"),
            );
          },
          separatorBuilder: (_,__) => Divider(height: 0,indent: 20,endIndent: 20,color: Theme.of(context).primaryColor,),
          itemCount: notes.length
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_app/models/note_for_listing.dart';
import 'package:notes_app/views/note_modify.dart';



class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

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
            // Navigator.pushNamed(context, '/NoteModify');
            Navigator.push(context,MaterialPageRoute(builder: (_)=>NoteModify()));
          },
          child: Icon(Icons.add),
      ),

      body: ListView.separated(
          itemBuilder: (_,index){
            return ListTile(
              title: Text(notes[index].noteTitle,style: TextStyle(color: Theme.of(context).primaryColor),),
              subtitle: Text("Last edited on ${formatDateTime(notes[index].lastEditedDateTime)}"),
              onTap: (){
                // Navigator.pushNamed(context, '/NoteModify',arguments: notes[index].noteId);
                Navigator.push(context,MaterialPageRoute(builder: (_)=>NoteModify(noteId: notes[index].noteId,)));
              },
            );
          },
          separatorBuilder: (_,__) => Divider(height: 0,indent: 20,endIndent: 20,color: Theme.of(context).primaryColor,),
          itemCount: notes.length
      ),

    );
  }
}

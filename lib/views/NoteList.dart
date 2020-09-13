import 'package:flutter/material.dart';
import 'package:notes_app/models/note_for_listing.dart';
import 'package:notes_app/views/note_delete.dart';
import 'package:notes_app/views/note_modify.dart';



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
            // Navigator.pushNamed(context, '/NoteModify');
            Navigator.push(context,MaterialPageRoute(builder: (_)=>NoteModify()));
          },
          child: Icon(Icons.add),
      ),

      body: ListView.separated(
          itemBuilder: (_,index){
            return Dismissible(
              key: ValueKey(notes[index].noteId),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction){

              },
              confirmDismiss: (direction) async {
                final result = await showDialog(
                  context: context,
                  builder: (_)=>NoteDelete()
                );
                print(result);
                return result;
              },
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(Icons.delete,color: Colors.white,),
                ),
              ),
              child: ListTile(
                title: Text(notes[index].noteTitle,style: TextStyle(color: Theme.of(context).primaryColor),),
                subtitle: Text("Last edited on ${formatDateTime(notes[index].lastEditedDateTime)}"),
                onTap: (){
                  // Navigator.pushNamed(context, '/NoteModify',arguments: notes[index].noteId);
                  Navigator.push(context,MaterialPageRoute(builder: (_)=>NoteModify(noteId: notes[index].noteId,)));
                },
              ),
            );
          },
          separatorBuilder: (_,__) => Divider(height: 0,indent: 20,endIndent: 20,color: Theme.of(context).primaryColor,),
          itemCount: notes.length
      ),

    );
  }
}

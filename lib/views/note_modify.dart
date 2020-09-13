import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {

  final String noteId;
  NoteModify({this.noteId});

  bool get isEditing => noteId!=null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing?"Modify Note":"Add Note"),
        centerTitle: true,
      ),

      body: Padding(
        padding:  EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Note Title',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Note Content',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 35,),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                onPressed: (){
                  if(isEditing){
                    //update note in API
                  }else{
                    //create note in API
                  }
                  Navigator.pop(context);
                },
                color: Theme.of(context).primaryColor,
                child: Text("Submit",style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      ),

    );
  }
}

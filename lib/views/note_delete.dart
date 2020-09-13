import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Warning!!",style: TextStyle(color: Colors.red),),
      content: Text("Are you sure you want to delete this note"),
      actions: [
        FlatButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            child: Text("Cancel")
        ),
        FlatButton(
            onPressed: (){
              Navigator.of(context).pop(true);
            },
            child: Text("Delete")
        ),
      ],
    );
  }
}

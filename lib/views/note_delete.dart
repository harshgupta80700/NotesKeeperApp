import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {

  String title;
  String content;
  String buttonOne;
  String buttonTwo;
  NoteDelete({
    this.content = " ",
    this.title = " ",
    this.buttonOne = " " ,
    this.buttonTwo = " ",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title,style: TextStyle(color: Colors.red),),
      content: Text(content),
      actions: [
        FlatButton(
            onPressed: (){
              Navigator.of(context).pop(false);
            },
            child: Text(buttonOne)
        ),
        FlatButton(
            onPressed: (){
              Navigator.of(context).pop(true);
            },
            child: Text(buttonTwo)
        ),
      ],
    );
  }
}

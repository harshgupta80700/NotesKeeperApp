import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modify Note"),
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
            RaisedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              color: Theme.of(context).primaryColor,
              child: Text("Submit"),
            )
          ],
        ),
      ),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_app/Services/notes_service.dart';
import 'package:notes_app/models/note_by_id.dart';
import 'package:notes_app/models/notes_insert.dart';

import 'note_delete.dart';

class NoteModify extends StatefulWidget {

  final String noteId;
  NoteModify({this.noteId});

  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteId!=null;
  bool isLoading = false;

  NotesServices get services => GetIt.instance<NotesServices>();
  Note note;
  String errorMessage;

  final _titleController = TextEditingController();
  final _contentController = TextEditingController();


  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading =  true;
    });
    if(widget.noteId != null){
      services.getNote(widget.noteId).then((response){
        if(response.error){
          errorMessage = response.errorMessage;
        }
        note = response.data;
        print(note.noteId);
        _titleController.text = note.noteTitle;
        _contentController.text = note.noteContent;
        setState(() {
          isLoading = false;
        });
      });
    }else{
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing?"Modify Note":"Add Note"),
        centerTitle: true,
      ),

      body:  isLoading ? Center(child: CircularProgressIndicator()) : Padding(
            padding:  EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                      hintText: 'Note Title',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _contentController,
                  decoration: InputDecoration(
                      hintText: 'Note Content',
                      border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 35,),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      if(isEditing){
                        //update note in API
                      }else{
                        //create note in API
                        setState(() {
                          isLoading = true;
                        });
                        final note = NoteInsert(
                            noteTitle: _titleController.text,
                            noteContent: _contentController.text
                        );
                        final result = await services.createNote(note);
                        print(result.data);
                        print(result.errorMessage);
                        print(result.error);
                        final title = result.error ? result.errorMessage : "Note created";
                        print(title);
                        await showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text(title,style: TextStyle(color: Colors.black),),
                              actions: [
                                FlatButton(
                                    onPressed: (){
                                      print("hello");
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK")
                                ),
                              ],
                            )
                        );
                        setState(() {
                          isLoading = false;
                        });

                      }
                      Navigator.pop(context);
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text("Submit",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          )
      );
  }
}

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:notes_app/Services/notes_service.dart';
import 'package:notes_app/models/api_response.dart';
import 'package:notes_app/models/note_for_listing.dart';
import 'package:notes_app/views/note_delete.dart';
import 'package:notes_app/views/note_modify.dart';



class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

  NotesServices get services => GetIt.instance<NotesServices>();

  APIResponse<List<NoteForListing>> _apiResponse;

  bool isLoading = false;

  String formatDateTime (DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  _fetchNotes() async{
    setState(() {
      isLoading = true;
    });

    // _apiResponse = await services.getNotelist();
    //
    // setState(() {
    //   isLoading = false;
    // });

    services.getNotelist().then((value){
      _apiResponse = value;
      setState(() {
        isLoading =  false;
      });
    });

  }

  @override
  void initState() {
    _fetchNotes();
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
            Navigator.push(context,MaterialPageRoute(builder: (_)=>NoteModify())).then((value){
              _fetchNotes();
            });
          },
          child: Icon(Icons.add),
      ),

      body:Builder(
        builder: (_){

          if(isLoading){
            return Center(child: CircularProgressIndicator());
          }

          if(_apiResponse?.error){
            return Center(child: Text(_apiResponse.errorMessage),);
          }


          return ListView.separated(
              itemBuilder: (_,index){
                return Dismissible(
                  key: ValueKey(_apiResponse.data[index].noteId),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction){

                  },
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context,
                        builder: (_)=>NoteDelete(title: "Warning!!",content: "Are you sure you want to delete this note",buttonOne: "Cancel",buttonTwo: "Delete",)
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
                    title: Text(_apiResponse.data[index].noteTitle,style: TextStyle(color: Theme.of(context).primaryColor),),
                    subtitle: Text("Last edited on ${formatDateTime(_apiResponse.data[index].lastEditedDateTime ?? _apiResponse.data[index].createdDateTime)}"),
                    onTap: (){
                      // Navigator.pushNamed(context, '/NoteModify',arguments: notes[index].noteId);
                      Navigator.push(context,MaterialPageRoute(builder: (_)=>NoteModify(noteId: _apiResponse.data[index].noteId,)));
                    },
                  ),
                );
              },
              separatorBuilder: (_,__) => Divider(height: 0,indent: 20,endIndent: 20,color: Theme.of(context).primaryColor,),
              itemCount: _apiResponse.data.length
          );
        },
      )

    );
  }
}

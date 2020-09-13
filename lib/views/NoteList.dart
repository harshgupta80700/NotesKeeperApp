import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {

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
              title: Text("hello",style: TextStyle(color: Theme.of(context).primaryColor),),
              subtitle: Text("Last editied on 21/09/2020"),
            );
          },
          separatorBuilder: (_,__) => Divider(height: 0,indent: 20,endIndent: 20,color: Theme.of(context).primaryColor,),
          itemCount: 30
      ),

    );
  }
}

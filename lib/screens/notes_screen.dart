import 'package:flutter/material.dart';
import 'package:new_webapp_demo/model/notes_model.dart';

class NotesScreen extends StatefulWidget {
  final List<NotesModel> notesmodel;
  NotesScreen({@required this.notesmodel});
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
    int tabindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    appBar: AppBar(
      title: Text('Notes '),
    ),
    body: widget.notesmodel.length!=0 ? ListView.builder(
        itemCount: widget.notesmodel.length,
        itemBuilder: (BuildContext  context, int index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.blue,
                  child: Column(
                    children: [
                      
                       ListTile(
                         trailing: Icon(Icons.navigate_next,
                          color: Colors.white,
                         ),
                         leading: Icon(Icons.subject,
                          color: Colors.white,
                         ),
                         
                         
    title: Text('Subject : ${widget.notesmodel[index].subjectName}',style: TextStyle(
      color: Colors.white
    ),),
    subtitle: Text('Description : ${widget.notesmodel[index].description}',
    style: TextStyle(
      color: Colors.white
    ),
    ),
          ),
                    ],
                                      
                  ),
        ),
      );

      }) : Center(
        child: Text('No HomeWork is Posted',
        style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
        ),
        
        ),
      )
      
     
      //Text(widget.homeWorkModel[tabindex].homeWorkDescription),
    
    
        );
  }
}
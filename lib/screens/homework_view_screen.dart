import 'package:flutter/material.dart';
import 'package:new_webapp_demo/model/homework_model.dart';

class HomeWorkView extends StatefulWidget {
 final  List<HomeWorkModel> homeWorkModel;
  HomeWorkView({@required this.homeWorkModel});
  @override
  _HomeWorkViewState createState() => _HomeWorkViewState();
}

class _HomeWorkViewState extends State<HomeWorkView> {
  int tabindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    appBar: AppBar(
      centerTitle: true,
      title: Text('Homework '),
    ),
    body: widget.homeWorkModel.length!=0 ? ListView.builder(
        itemCount: widget.homeWorkModel.length,
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
                         
                         
    title: Text('Subject : ${widget.homeWorkModel[index].subject}',style: TextStyle(
      color: Colors.white
    ),),
    subtitle: Text('Description : ${widget.homeWorkModel[index].homeWorkDescription}',
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
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
        ),
        
        ),
      )
      
     
      //Text(widget.homeWorkModel[tabindex].homeWorkDescription),
    
    
        );
  }


}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_webapp_demo/model/parent_data_model.dart';

class HomeScreen extends StatefulWidget {
  final ParentModel parentinput;
  HomeScreen({this.parentinput});
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final imageurl ='https://schoolskies.blob.core.windows.net/common/Parent/Full/';
  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: _onBackPressed,
          child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,

          title: Text('Welcome ${widget.parentinput.parentDetails.fatherFirstName +" "+widget.parentinput.parentDetails.fatherLastName}'),
        ),
        body: Center(
          child: Column(
              children: [
                
                Image.network(
                  imageurl+image(widget.parentinput.parentDetails.fatherProfilePic),
                ),
              ],
          ),
        ),
      ),
    );
  }
  Future<bool> _onBackPressed() {
  return showDialog(
    context: context,
    builder: (context) => new AlertDialog(
      title: new Text('Are you sure?'),
      content: new Text('Do you want to exit an App'),
      actions: <Widget>[
        new GestureDetector(
          onTap: () => Navigator.of(context).pop(false),
          child: Text("NO"),
        ),
        SizedBox(height: 16),
        new GestureDetector(
          onTap: () => SystemNavigator.pop(),
          child: Text("YES"),
        ),
      ],
    ),
  ) ??
      false;
}


String image (String url)
{
  List<String> spliturl = url.split('/');
  var output = spliturl[5].toString();
  return output;
}
}
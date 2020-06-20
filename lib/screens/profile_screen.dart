import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_webapp_demo/model/login_reques_model.dart';
import 'dart:ui' as ui;

import 'package:new_webapp_demo/model/parent_data_model.dart';

class MyProfile extends StatefulWidget {
  final ParentModel parentinput;
  final LoginRequest loginRequestdemo;

  MyProfile(
      {Key key, @required this.parentinput, @required this.loginRequestdemo})
      : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final imageurl =
        'https://schoolskies.blob.core.windows.net/common/Parent/Full/';
    //bool isnull=false ;

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Stack(children: <Widget>[
        Container(
          color: Colors.blue,
        ),
        BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(1.0)),
              ),
            )),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: _height / 12,
                ),
                if (widget.parentinput.parentDetails.fatherProfilePic == null ||
                    widget.parentinput.parentDetails.motherProfilePic == null)
                  CircleAvatar(
                      radius: _width < _height ? _width / 4 : _height / 4,
                      backgroundImage: AssetImage('images/fatherProfile.jpg'),)
                    
                    
                       else if(widget.loginRequestdemo.name
                        .split(" ")
                        .join()
                        .toString() ==
                    widget.parentinput.parentDetails.fatherFirstName +
                        widget.parentinput.parentDetails.fatherLastName)
                       CircleAvatar(
                      radius: _width < _height ? _width / 4 : _height / 4,
                      backgroundImage: NetworkImage((imageurl+image(widget.parentinput.parentDetails.fatherProfilePic)),),)
                      else  
                       CircleAvatar(
                      radius: _width < _height ? _width / 4 : _height / 4,
                      backgroundImage: NetworkImage((imageurl+image(widget.parentinput.parentDetails.motherProfilePic)),),),

                      
                SizedBox(
                  height: _height / 25.0,
                ),
                if (widget.parentinput.parentDetails.fatherFirstName == null ||
                    widget.parentinput.parentDetails.motherFirstName == null)
                  Text("SchoolSkies")
                else if (widget.loginRequestdemo.name
                        .split(" ")
                        .join()
                        .toString() ==
                    widget.parentinput.parentDetails.fatherFirstName +
                        widget.parentinput.parentDetails.fatherLastName)
                  Text(
                    '${widget.parentinput.parentDetails.fatherFirstName + " " + widget.parentinput.parentDetails.fatherLastName}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.white),
                  )
                else
                  Text(
                    '${widget.parentinput.parentDetails.motherFirstName + "" + widget.parentinput.parentDetails.motherLastName}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.white),
                  ),
                SizedBox(
                  height: _height / 25.0,
                ),
                if (widget.parentinput.parentDetails.fatherFirstName == null ||
                    widget.parentinput.parentDetails.motherFirstName == null)
                  Text("User")
                else if (widget.loginRequestdemo.name
                        .split(" ")
                        .join()
                        .toString() ==
                    widget.parentinput.parentDetails.fatherFirstName +
                        widget.parentinput.parentDetails.fatherLastName)
                  Text(
                    'MobileNumber : ${widget.parentinput.parentDetails.fatherMobile}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 20,
                        color: Colors.white),
                  )
                else
                  Text(
                    'MobileNumber : ${widget.parentinput.parentDetails.motherMobile}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 20,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 20.0),
                if (widget.parentinput.parentDetails.fatherFirstName == null ||
                    widget.parentinput.parentDetails.motherFirstName == null)
                  Text("User")
                else if (widget.loginRequestdemo.name
                        .split(" ")
                        .join()
                        .toString() ==
                    widget.parentinput.parentDetails.fatherFirstName +
                        widget.parentinput.parentDetails.fatherLastName)
                  Text(
                    'Email ID : ${widget.parentinput.parentDetails.fatherEmail}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 20,
                        color: Colors.white),
                  )
                else
                  Text(
                    'Email ID : ${widget.parentinput.parentDetails.motherEmail}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 20,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(
                  height: _height / 25.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: _width / 8, right: _width / 8),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Icon(Icons.power_settings_new),
                        SizedBox(
                          width: _width / 30,
                        ),
                        Text('Go Back')
                      ],
                    )),
                    color: Colors.blue[50],
                  ),
                ),
              ],
            ))
      ]),
    );
  }

  String image(String url) {
    List<String> spliturl = url.split('/');
    var output = spliturl[5].toString();
    return output;
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () => SystemNavigator.pop(),
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }
}

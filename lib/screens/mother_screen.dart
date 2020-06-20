import 'package:flutter/material.dart';
import 'package:new_webapp_demo/model/parent_data_model.dart';
import 'dart:ui' as ui;

class MotherProfile extends StatefulWidget {
  final ParentModel parentinput;

  const MotherProfile({Key key, this.parentinput}) : super(key: key);
  @override
  _MotherProfileState createState() => _MotherProfileState();
}

class _MotherProfileState extends State<MotherProfile> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final imageurl =
        'https://schoolskies.blob.core.windows.net/common/Parent/Full/';
      

    return Stack(children: <Widget>[
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
              CircleAvatar(
                radius: _width < _height ? _width / 4 : _height / 4,
                backgroundImage: widget
                            .parentinput.parentDetails.motherProfilePic ==
                        null
                    ? AssetImage(
                        'images/motherProfile.jpg')
                    : NetworkImage(
                        (imageurl +
                            image(widget
                                .parentinput.parentDetails.motherProfilePic)),
                      ),
              ),
              SizedBox(
                height: _height / 25.0,
              ),
               widget.parentinput.parentDetails.motherFirstName ==null ? Text("SchoolSkies")  :
              Text(
                '${widget.parentinput.parentDetails.motherFirstName + " " + widget.parentinput.parentDetails.motherLastName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _width / 15,
                    color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _height / 30, left: _width / 8, right: _width / 8),
                child: Text(
                    "Mobile Number: ${widget.parentinput.parentDetails.motherMobile}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: _width / 25,
                        color: Colors.white),
                    textAlign: TextAlign.center),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(
                    top: _height / 30, left: _width / 8, right: _width / 8),
                child: Text(
                    "Email ID: ${widget.parentinput.parentDetails.motherEmail}",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: _width / 25,
                        color: Colors.white),
                    textAlign: TextAlign.center),
              ),
              SizedBox(
                height: _height / 25.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: _width / 8, right: _width / 8),
                child: FlatButton(
                  onPressed: (){

                  },
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.power_settings_new),
                      SizedBox(
                        width: _width / 30,
                      ),
                      Text('GoBack')
                    ],
                  )),
                  color: Colors.blue[50],
                ),
              ),
            ],
          ))
    ]);
  }

  String image(String url) {
    List<String> spliturl = url.split('/');
    var output = spliturl[5].toString();
    return output;
  }


}

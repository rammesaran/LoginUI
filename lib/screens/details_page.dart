import 'package:flutter/material.dart';
import 'package:new_webapp_demo/model/homework_model.dart';

class DetailsPage extends StatefulWidget {
  final List<HomeWorkModel> homeworkdetails;

  const DetailsPage({Key key, @required this.homeworkdetails})
      : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.homeworkdetails[0].homeWorkDescription),
      ),
    );
  }
}

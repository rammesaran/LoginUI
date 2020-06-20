import 'package:flutter/material.dart';
import 'package:new_webapp_demo/model/test_model.dart';

class TestAndAssignment extends StatefulWidget {
  final List<TestModel> testassignment;

  const TestAndAssignment({Key key, @required this.testassignment})
      : super(key: key);
  @override
  _TestAndAssignmentState createState() => _TestAndAssignmentState();
}

class _TestAndAssignmentState extends State<TestAndAssignment> {
  int tabindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Test & Assignment'),
        ),
        body: widget.testassignment.length != 0
            ? ListView.builder(
                itemCount: widget.testassignment.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.blue,
                      child: Column(
                        children: [
                          ListTile(
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                            ),
                            leading: Icon(
                              Icons.subject,
                              color: Colors.white,
                            ),
                            title: Text(
                              'Subject : ${widget.testassignment[index].subjectName}',
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              'Description : ${widget.testassignment[index].description}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : Center(
                child: Text(
                  'No Test & Assignment is Posted',
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

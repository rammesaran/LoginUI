import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_webapp_demo/model/homework_model.dart';
import 'package:new_webapp_demo/model/login_reques_model.dart';
import 'package:new_webapp_demo/model/notes_model.dart';
import 'package:new_webapp_demo/model/parent_data_model.dart';
import 'package:new_webapp_demo/model/test_model.dart';
import 'package:new_webapp_demo/screens/homework_view_screen.dart';
import 'package:new_webapp_demo/screens/notes_screen.dart';
import 'package:new_webapp_demo/screens/profile_screen.dart';
import 'package:new_webapp_demo/screens/test_assignment_screen.dart';
import 'package:new_webapp_demo/services/login_request.dart';

class StudentDataDetails extends StatefulWidget {
  
  final ParentModel parentModel;
  final LoginRequest loginrequest;
  StudentDataDetails({@required this.parentModel, @required this.loginrequest});
  @override
  _StudentDataDetailsState createState() => _StudentDataDetailsState();
}

class _StudentDataDetailsState extends State<StudentDataDetails>
    with TickerProviderStateMixin {
   
  String getsplitimage(String url) {
    List<String> data = url.split('/');
    String schoolid = data[4];
    String photourl = data[6];
    String finalurl =
        "https://schoolskies.blob.core.windows.net/school-$schoolid/Student/Full/$photourl";
    return finalurl;
  }
  
  TabController _tabController;
  final List<Tab> myTabs = <Tab>[];
  int tabIndex = 0;

  getTabMenus() {
    for (var item in widget.parentModel.studentDetails) {
      myTabs.add(Tab(
        text: item.firstName + '' + item.lastName.toString(),
      ));
    }
  }


  @override
  void initState() {
    super.initState();
    getTabMenus();

    _tabController =
        TabController(initialIndex: 0, length: myTabs.length, vsync: this);

    _tabController.addListener(() {
      setState(() {
        tabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    NetworkRequest request = NetworkRequest();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: myTabs.length,
          child: Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
          UserAccountsDrawerHeader(
            accountName: ( widget.loginrequest.name.split(" ").join().toString() == widget.parentModel.parentDetails.fatherFirstName+widget.parentModel.parentDetails.fatherLastName ) ? Text(
        widget.parentModel.parentDetails.fatherFirstName +
            '' +
            widget.parentModel.parentDetails.fatherLastName) : Text(widget.parentModel.parentDetails.motherFirstName + ''+widget.parentModel.parentDetails.motherLastName,),
            accountEmail:
            
             ( widget.loginrequest.name.split(" ").join().toString() == widget.parentModel.parentDetails.fatherFirstName+widget.parentModel.parentDetails.fatherLastName ) ?
        Text(widget.parentModel.parentDetails.fatherEmail) : Text(widget.parentModel.parentDetails.motherEmail) ?? Text('No Emailid'),
            currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.white,
      child:  widget.loginrequest.name.split(" ").join().toString() == widget.parentModel.parentDetails.fatherFirstName+widget.parentModel.parentDetails.fatherLastName ? Text(
        widget.parentModel.parentDetails.fatherFirstName[0], 
        style: TextStyle(fontSize: 40.0),
      ) : Text(
        widget.parentModel.parentDetails.motherFirstName[0],
        style: TextStyle(
            fontSize: 40.0,
        ),
      ),
            ),
          ),
          ListTile(
            title: Text('Profile'),
            onTap: () async {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyProfile(
                    loginRequestdemo: widget.loginrequest,
                    parentinput: widget.parentModel,
                  )));
            },
            trailing: Icon(Icons.arrow_right),
          ),
          ListTile(
              title: Text('Logout'),
              onTap: _onBackPressed,
              trailing: Icon(Icons.power_settings_new),
          ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Welcome Parent'),
        centerTitle: true,
        bottom: TabBar(
          dragStartBehavior: DragStartBehavior.start,
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.red,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        dragStartBehavior: DragStartBehavior.start,
        controller: _tabController,
        children: myTabs.map(
          (Tab tab) {
          return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Student Name : ${widget.parentModel.studentDetails[tabIndex].firstName + '' + widget.parentModel.studentDetails[tabIndex].lastName.toString()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                        0.0, 12.0, 0.0, 12.0),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            'Admission Number : ${widget.parentModel.studentDetails[tabIndex].schoolStudentId}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                          flex: 3,
                        ),
                        Flexible(
                          child: Container(
                            height: 80.0,
                            width: 80.0,
                            child: widget.parentModel.studentDetails[tabIndex].profilePic!=null ? Image.network(getsplitimage(
                                widget
                                    .parentModel
                                    .studentDetails[tabIndex]
                                    .profilePic)) : Image.asset('images/childrenProfile.jpg')
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'DOB: ${widget.parentModel.studentDetails[tabIndex].dateOfBirth}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                          color: Colors.blue,
                          onPressed: () async {
                            List<HomeWorkModel> homeWorkModeldata =
                                await request.getHomeWork(
                    widget
                    .parentModel
                    .studentDetails[tabIndex]
                    .studentId,
                    widget
                    .parentModel
                    .studentDetails[tabIndex]
                    .schoolId);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                    builder: (context) =>
                    HomeWorkView(
                      homeWorkModel:
                          homeWorkModeldata,
                    )));
                          },
                          child: Text('Homework',
                            style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        ),

                        RaisedButton(
                          color: Colors.blue,
                          onPressed: () async {
                            List<NotesModel> notesModeldata =
                                await request.getNotesDetails(
                    widget
                    .parentModel
                    .studentDetails[tabIndex]
                    .studentId,
                    widget
                    .parentModel
                    .studentDetails[tabIndex]
                    .schoolId);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                    builder: (context) =>
                  NotesScreen(
                    notesmodel: notesModeldata,
                  )
                    ),
                    );
                          },
                          child: Text('Notes',
                            style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          onPressed: () async {
                            List<TestModel> testmodeldata =
                                await request.getTestDetails(
                    widget
                    .parentModel
                    .studentDetails[tabIndex]
                    .studentId,
                    widget
                    .parentModel
                    .studentDetails[tabIndex]
                    .schoolId);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                    builder: (context) =>
                    TestAndAssignment(
                      testassignment:
                          testmodeldata,
                    )));
                          },
                          child: Text('Test',
                            style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        ),

                         
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         RaisedButton(
                          color: Colors.blue,
                          onPressed: () async {
                            List<TestModel> testmodeldata =
                                await request.getAssignmentDetails(
                    widget
                    .parentModel
                    .studentDetails[tabIndex]
                    .studentId,
                    widget
                    .parentModel
                    .studentDetails[tabIndex]
                    .schoolId);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                    builder: (context) =>
                    TestAndAssignment(
                      testassignment:
                          testmodeldata,
                    )));
                          },
                          child: Text('Assignment',
                            style: TextStyle(
                                color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      });
          },
        ).toList(),
      ),

            ),
        ),
    );
  }
    Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) =>  AlertDialog(
            title:  Text('Are you sure?'),
            content:  Text('Do you want to exit an App'),
            actions: <Widget>[
               GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: Text("NO"),
              ),
              SizedBox(height: 16),
               GestureDetector(
                onTap: ()async{
               
                  SystemNavigator.pop();
                }, 
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
        false;
  }


}

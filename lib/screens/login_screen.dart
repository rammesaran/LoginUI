import 'package:flutter/material.dart';
import 'package:new_webapp_demo/model/login_reques_model.dart';
import 'package:new_webapp_demo/model/parent_data_model.dart';
import 'package:new_webapp_demo/screens/students_screen.dart';
import 'package:new_webapp_demo/services/login_request.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool passwordVisible;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }


  @override
  Widget build(BuildContext context) {
// logo
    Widget logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset('images/school.png'),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blue,
      body: Builder(
        builder: (context) => Center(
          child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logo,
                    textMobilenumber(),
                    SizedBox(
                      height: 10,
                    ),
                    textPassword(),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.all(12),
                        color: Colors.white,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            NetworkRequest request = NetworkRequest();
                            LoginRequest input = await request.getLoginUsers(
                                mobilenumber.text.trim(), password.text.trim());

                            if (input.loginId != 0 &&
                                input.status !=
                                    'Invalid UserName and PassWord') {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: input.name != ""
                                          ? Text('Welcome ${input.name}')
                                          : Text('Welcome SchoolSkies User'),
                                      content: Text(
                                              'Login Status Message : ${input.status}') ??
                                          Text('Invalid Name'),
                                      actions: [
                                        FlatButton(
                                          onPressed: () async {
                                            ParentModel parentdata =
                                                await request.getParentDetails(
                                                    input.loginId);
                                            if (input.name == "") {
                                           
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      StudentDataDetails(
                                                    loginrequest: input,
                                                    parentModel: parentdata,
                                                  ),
                                                ),
                                              );
                                            } else if (input.name
                                                    .split(" ")
                                                    .join() ==
                                                parentdata.parentDetails
                                                        .fatherFirstName +
                                                    parentdata.parentDetails
                                                        .fatherLastName) {
                                       
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      StudentDataDetails(
                                                    loginrequest: input,
                                                    parentModel: parentdata,
                                                  ),
                                                ),
                                              );
                                            } else if (input.name
                                                    .split(" ")
                                                    .join() ==
                                                parentdata.parentDetails
                                                        .motherFirstName +
                                                    parentdata.parentDetails
                                                        .motherLastName) {
                                     
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      //     MotherProfile(
                                                      //   parentinput: parentdata,
                                                      // ),
                                                      StudentDataDetails(
                                                    loginrequest: input,
                                                    parentModel: parentdata,
                                                  ),
                                                ),
                                              );
                                            }

                                            //Navigator.pop(context);
                                            mobilenumber.clear();
                                            password.clear();
                                          },
                                          child: const Text('Ok'),
                                        ),
                                      ],
                                    );
                                  });
                            } else if (input.status ==
                                'Invalid UserName and PassWord') {
                         
                              final snackBar = SnackBar(
                                content:
                                    Text('Invalid MobileNumber or Password'),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            } else {
                
                              final snackBar = SnackBar(
                                content: Text('UserName Not Exit in System'),
                              );
                              Scaffold.of(context).showSnackBar(snackBar);
                            }
                          }
                        },
                        child: Text("Submit"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textMobilenumber() {
    return Theme(
      data: ThemeData(primaryColor: Colors.white),
      child: TextFormField(
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        validator: (text) {
          if (text.isEmpty) {
            return 'Mobile number should not be empty';
          }
          if (text.length < 10) {
            return "Mobile number should be 10 digit";
          }

          return null;
        },
        autofocus: false,
        keyboardType: TextInputType.phone,
        maxLength: 10,
        controller: mobilenumber,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            errorStyle: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 15.0,
            ),
            labelStyle: TextStyle(color: Colors.white),
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.white,
            ),
            border: OutlineInputBorder(),
            labelText: 'Mobilenumber',
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: IconButton(
                color: Colors.white,
                icon: Icon(Icons.clear),
                onPressed: () => mobilenumber.clear()),
            hintText: 'Enter a Mobile number'),
      ),
    );
  }

  Widget textPassword() {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.white,
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        validator: (text) {
          if (text.isEmpty) {
            return 'Password  should not be empty';
          }
          if (text.length < 6) {
            return 'Password should not be less then 6';
          }
          return null;
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white)),
            errorStyle: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 15.0,
            ),
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
            labelText: 'Password',
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            hintText: "Enter a password",
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: IconButton(
                color: Colors.white,
                icon: Icon(
                    passwordVisible ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                })),
        obscureText: passwordVisible,
        controller: password,
      ),
    );
  }
}

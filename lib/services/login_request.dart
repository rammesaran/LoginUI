import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_webapp_demo/model/homework_model.dart';
import 'package:new_webapp_demo/model/login_reques_model.dart';
import 'package:new_webapp_demo/model/notes_model.dart';
import 'package:new_webapp_demo/model/parent_data_model.dart';
import 'package:new_webapp_demo/model/test_model.dart';

const auth = 5;
const url ="https://bhavans.schoolskies.com/API/CommonApi/AuthendicateSchool?authType=$auth";
const profileurl = "https://bhavans.schoolskies.com/API/CommonApi/GetParentDetails";
const homeworkurl ='https://bhavans.schoolskies.com/API/CommonApi/GetStudentHomeWorks';
const notesurl ='https://bhavans.schoolskies.com/API/CommonApi/GetStudentNotes';
const testurl ='https://bhavans.schoolskies.com/API/CommonApi/GetStudentTestAndAssignment';

class NetworkRequest{
Future<LoginRequest> getLoginUsers(String mobilenumber, String password)async
{
  var response = await http.get('$url&userName=$mobilenumber&passWord=$password');
  var data = LoginRequest.fromJson(json.decode(response.body));
  return data;
}

Future<ParentModel> getParentDetails(int loginid)async
{
  var response = await http.get('$profileurl?loginId=$loginid');
  var parentmodeldata = ParentModel.fromJson(json.decode(response.body));
  return parentmodeldata;
 
}

Future<List<HomeWorkModel>> getHomeWork(int studentid, int schoolid)async{

var response = await http.get('$homeworkurl?studentId=$studentid&schoolId=$schoolid');
    Iterable list = (json.decode(response.body));
    List<HomeWorkModel> homeworkdata = list.map((e) => HomeWorkModel.fromJson(e)).toList();
    return homeworkdata;

}

Future<List<NotesModel>> getNotesDetails(int studentid, int schoolid)async{

var response = await http.get('$notesurl?studentId=$studentid&schoolId=$schoolid');
    Iterable list = (json.decode(response.body));
    List<NotesModel> notesdata = list.map((e) => NotesModel.fromJson(e)).toList();
    return notesdata;

}

Future<List<TestModel>> getTestDetails(int studentid,  int schoolid, {int typeid=1})async{

var response = await http.get('$testurl?studentId=$studentid&type=$typeid&schoolId=$schoolid');
    Iterable list = (json.decode(response.body));
    List<TestModel> testdata = list.map((e) => TestModel.fromJson(e)).toList();
    return testdata;

}


}

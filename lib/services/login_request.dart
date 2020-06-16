import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:new_webapp_demo/model/login_reques_model.dart';
import 'package:new_webapp_demo/model/parent_data_model.dart';

const auth = 5;
const url ="https://bhavans.schoolskies.com/API/CommonApi/AuthendicateSchool?authType=$auth";
const profileurl = "https://bhavans.schoolskies.com/API/CommonApi/GetParentDetails";
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
}

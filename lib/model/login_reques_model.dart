class LoginRequest {
  int loginId;
  String name;
  String status;

  LoginRequest({this.loginId, this.name, this.status});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    loginId = json['LoginId'];
    name = json['Name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LoginId'] = this.loginId;
    data['Name'] = this.name;
    data['status'] = this.status;
    return data;
  }
}
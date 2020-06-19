
class ParentModel {
  ParentDetails parentDetails;
  List<StudentDetails> studentDetails;

  ParentModel({this.parentDetails, this.studentDetails});

  ParentModel.fromJson(Map<String, dynamic> json) {
    parentDetails = json['ParentDetails'] != null
        ? new ParentDetails.fromJson(json['ParentDetails'])
        : null;
    if (json['StudentDetails'] != null) {
      studentDetails = new List<StudentDetails>();
      json['StudentDetails'].forEach((v) {
        studentDetails.add(new StudentDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parentDetails != null) {
      data['ParentDetails'] = this.parentDetails.toJson();
    }
    if (this.studentDetails != null) {
      data['StudentDetails'] =
          this.studentDetails.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParentDetails {
  int parentId;
  String fatherFirstName;
  String fatherLastName;
  String fatherEmail;
  String fatherMobile;
  String fatherEmployer;
  String fatherProfilePic ;
  String fatherQualification;
  String motherFirstName;
  String motherLastName;
  String motherEmail;
  String motherMobile;
  String motherEmployer;
  String motherProfilePic;
  String motherQualification;

  ParentDetails({
    this.parentId,
    this.fatherFirstName,
    this.fatherLastName,
    this.fatherEmail,
    this.fatherMobile,
    this.fatherEmployer,
    this.fatherProfilePic,
    this.fatherQualification,
    this.motherFirstName,
    this.motherLastName,
    this.motherEmail,
    this.motherMobile,
    this.motherEmployer,
    this.motherProfilePic,
    this.motherQualification,
  });

  ParentDetails.fromJson(Map<String, dynamic> json) {
    parentId = json['ParentId'];
    fatherFirstName = json['FatherFirstName'];
    fatherLastName = json['FatherLastName'];
    fatherEmail = json['FatherEmail'];

    fatherMobile = json['FatherMobile'];
    fatherEmployer = json['FatherEmployer'];
    fatherProfilePic = json['FatherProfilePic'];
    fatherQualification = json['FatherQualification'];

    motherFirstName = json['MotherFirstName'];
    motherLastName = json['MotherLastName'];
    motherEmail = json['MotherEmail'];

    motherMobile = json['MotherMobile'];
    motherEmployer = json['MotherEmployer'];
    motherProfilePic = json['MotherProfilePic'];
    motherQualification = json['MotherQualification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ParentId'] = this.parentId;
    data['FatherFirstName'] = this.fatherFirstName;
    data['FatherLastName'] = this.fatherLastName;
    data['FatherEmail'] = this.fatherEmail;

    data['FatherMobile'] = this.fatherMobile;
    data['FatherEmployer'] = this.fatherEmployer;
    data['FatherProfilePic'] = this.fatherProfilePic;
    data['FatherQualification'] = this.fatherQualification;

    data['MotherFirstName'] = this.motherFirstName;
    data['MotherLastName'] = this.motherLastName;
    data['MotherEmail'] = this.motherEmail;

    data['MotherMobile'] = this.motherMobile;
    data['MotherEmployer'] = this.motherEmployer;
    data['MotherProfilePic'] = this.motherProfilePic;
    data['MotherQualification'] = this.motherQualification;

    return data;
  }
}

class StudentDetails {
  int studentId;
  String firstName;
  String lastName;
  String schoolStudentId;
  String dateOfBirth;
  int schoolId;
  String admissionNo;
  int genderId;
  String profilePic;
  String admittedDate;
  String emailId;
  int classId;
  int classSectionId;
  StudentDetails(
      {this.studentId,
      this.firstName,
      this.lastName,
      this.schoolStudentId,
      this.dateOfBirth,
      this.schoolId,
      this.admissionNo,
      this.genderId,
      this.profilePic,
      this.admittedDate,
      this.classSectionId});

  StudentDetails.fromJson(Map<String, dynamic> json) {
    studentId = json['StudentId'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    admittedDate =json['AdmittedDate'];
    schoolStudentId = json['SchoolStudentId'];
    dateOfBirth = json['DateOfBirth'];
    schoolId = json['SchoolId'];

    admissionNo = json['AdmissionNo'];
    genderId = json['GenderId'];

    profilePic = json['ProfilePic'];

    emailId = json['EmailId'];

    classId = json['ClassId'];
    classSectionId = json['ClassSectionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StudentId'] = this.studentId;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['SchoolStudentId'] = this.schoolStudentId;
    data['DateOfBirth'] = this.dateOfBirth;
    data['SchoolId'] = this.schoolId;
    data['AdmissionNo'] = this.admissionNo;
    data['GenderId'] = this.genderId;
    data['AdmittedDate'] = this.admittedDate;
    data['EmailId'] = this.emailId;

    data['ClassSectionId'] = this.classSectionId;
    return data;
  }
}

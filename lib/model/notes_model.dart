class NotesModel {
  int rowNumber;
  int notesID;
  int tagID;
  String tagName;
  String subjectName;
  String firstName;
  String lastName;
  int gender;
  String schoolStudentId;
  String className;
  String sectionName;
  String classSection;
  String description;
  String createdBy;
  String createdOn;
  Null filePath;
  Null isvideo;
  String postedOn;
  int totalCount;

  NotesModel(
      {this.rowNumber,
      this.notesID,
      this.tagID,
      this.tagName,
      this.subjectName,
      this.firstName,
      this.lastName,
      this.gender,
      this.schoolStudentId,
      this.className,
      this.sectionName,
      this.classSection,
      this.description,
      this.createdBy,
      this.createdOn,
      this.filePath,
      this.isvideo,
      this.postedOn,
      this.totalCount});

  NotesModel.fromJson(Map<String, dynamic> json) {
    rowNumber = json['RowNumber'];
    notesID = json['NotesID'];
    tagID = json['TagID'];
    tagName = json['TagName'];
    subjectName = json['SubjectName'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    gender = json['Gender'];
    schoolStudentId = json['SchoolStudentId'];
    className = json['ClassName'];
    sectionName = json['SectionName'];
    classSection = json['ClassSection'];
    description = json['Description'];
    createdBy = json['CreatedBy'];
    createdOn = json['CreatedOn'];
    filePath = json['FilePath'];
    isvideo = json['Isvideo'];
    postedOn = json['PostedOn'];
    totalCount = json['TotalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RowNumber'] = this.rowNumber;
    data['NotesID'] = this.notesID;
    data['TagID'] = this.tagID;
    data['TagName'] = this.tagName;
    data['SubjectName'] = this.subjectName;
    data['FirstName'] = this.firstName;
    data['LastName'] = this.lastName;
    data['Gender'] = this.gender;
    data['SchoolStudentId'] = this.schoolStudentId;
    data['ClassName'] = this.className;
    data['SectionName'] = this.sectionName;
    data['ClassSection'] = this.classSection;
    data['Description'] = this.description;
    data['CreatedBy'] = this.createdBy;
    data['CreatedOn'] = this.createdOn;
    data['FilePath'] = this.filePath;
    data['Isvideo'] = this.isvideo;
    data['PostedOn'] = this.postedOn;
    data['TotalCount'] = this.totalCount;
    return data;
  }
}
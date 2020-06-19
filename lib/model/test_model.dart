class TestModel {
  int rowNumber;
  int tstAssgnId;
  String subjectName;
  String description;
  String studentName;
  String classSection;
  String postedBy;
  String startDate;
  String createdOn;
  String emptyRecordDate;
  Null mediaPath;
  Null isvideo;
  int totalCount;

  TestModel(
      {this.rowNumber,
      this.tstAssgnId,
      this.subjectName,
      this.description,
      this.studentName,
      this.classSection,
      this.postedBy,
      this.startDate,
      this.createdOn,
      this.emptyRecordDate,
      this.mediaPath,
      this.isvideo,
      this.totalCount});

  TestModel.fromJson(Map<String, dynamic> json) {
    rowNumber = json['RowNumber'];
    tstAssgnId = json['TstAssgnId'];
    subjectName = json['SubjectName'];
    description = json['Description'];
    studentName = json['StudentName'];
    classSection = json['ClassSection'];
    postedBy = json['PostedBy'];
    startDate = json['StartDate'];
    createdOn = json['CreatedOn'];
    emptyRecordDate = json['EmptyRecordDate'];
    mediaPath = json['MediaPath'];
    isvideo = json['Isvideo'];
    totalCount = json['TotalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RowNumber'] = this.rowNumber;
    data['TstAssgnId'] = this.tstAssgnId;
    data['SubjectName'] = this.subjectName;
    data['Description'] = this.description;
    data['StudentName'] = this.studentName;
    data['ClassSection'] = this.classSection;
    data['PostedBy'] = this.postedBy;
    data['StartDate'] = this.startDate;
    data['CreatedOn'] = this.createdOn;
    data['EmptyRecordDate'] = this.emptyRecordDate;
    data['MediaPath'] = this.mediaPath;
    data['Isvideo'] = this.isvideo;
    data['TotalCount'] = this.totalCount;
    return data;
  }
}
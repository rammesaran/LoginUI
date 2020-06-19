class HomeWorkModel {
  int homeWorkId;
  String subject;
  String homeWorkDescription;
  String studentName;
  Null entityID;
  String classSection;
  String postedBy;
  String startDate;
  int loginId;
  int subjectId;
  Null medialibraryId;
  Null mediaPath;
  Null isVideo;
  String createdOn;
  String emptyRecordDate;
  int totalCount;

  HomeWorkModel(
      {this.homeWorkId,
      this.subject,
      this.homeWorkDescription,
      this.studentName,
      this.entityID,
      this.classSection,
      this.postedBy,
      this.startDate,
      this.loginId,
      this.subjectId,
      this.medialibraryId,
      this.mediaPath,
      this.isVideo,
      this.createdOn,
      this.emptyRecordDate,
      this.totalCount});

  HomeWorkModel.fromJson(Map<String, dynamic> json) {
    homeWorkId = json['HomeWorkId'];
    subject = json['Subject'];
    homeWorkDescription = json['HomeWorkDescription'];
    studentName = json['StudentName'];
    entityID = json['EntityID'];
    classSection = json['ClassSection'];
    postedBy = json['PostedBy'];
    startDate = json['StartDate'];
    loginId = json['LoginId'];
    subjectId = json['SubjectId'];
    medialibraryId = json['MedialibraryId'];
    mediaPath = json['MediaPath'];
    isVideo = json['IsVideo'];
    createdOn = json['CreatedOn'];
    emptyRecordDate = json['EmptyRecordDate'];
    totalCount = json['TotalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HomeWorkId'] = this.homeWorkId;
    data['Subject'] = this.subject;
    data['HomeWorkDescription'] = this.homeWorkDescription;
    data['StudentName'] = this.studentName;
    data['EntityID'] = this.entityID;
    data['ClassSection'] = this.classSection;
    data['PostedBy'] = this.postedBy;
    data['StartDate'] = this.startDate;
    data['LoginId'] = this.loginId;
    data['SubjectId'] = this.subjectId;
    data['MedialibraryId'] = this.medialibraryId;
    data['MediaPath'] = this.mediaPath;
    data['IsVideo'] = this.isVideo;
    data['CreatedOn'] = this.createdOn;
    data['EmptyRecordDate'] = this.emptyRecordDate;
    data['TotalCount'] = this.totalCount;
    return data;
  }
}
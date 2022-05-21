// TODO Implement this library.
import '';

class HomeworkData {
  String assignmentId = "";
  String subject = "";
  String deadline = "";
  String fileName = "";
  String teacherId = "";
  String subjectId = "";

  HomeworkData(String assignmentId, String subject, String deadline, String fileName, String teacherId, String subjectId) {
    this.assignmentId = assignmentId;
    this.subject = subject;
    this.fileName = fileName;
    this.deadline = deadline;
    this.teacherId = teacherId;
    this.subjectId = subjectId;
  }

  HomeworkData.fromJson(Map<dynamic, dynamic> json) {
    fileName = json['fileName'] as String;

    subject = json['subject'] as String;
    deadline = json['deadline'] as String;
    
    teacherId = json['teacherId'] as String;
    subjectId = json['subjectId'] as String;
    assignmentId = json['assignmentId'] as String;
  }

  Map<String, Object> toJson() => <String, Object>{
        'subject': subject,
        'fileName': fileName,
        'deadline': deadline,
        'teacherId': teacherId,
        'subjectId': subjectId,
        'assignmentId': assignmentId
      };
}



class HomeworkSubmitData {
  String submitId = "";
  String studentName = "";
  String fileName = "";
  String assignmnetId = "";
  String studentId = "";
  String subjectId = "";
  String teacherId = "";
  String uploadedDate = "";

  HomeworkSubmitData(String submitId, String fileName, String assignmentId, String studentId, String subjectId, String teacherId, String uploadedDate, String studentName) {
    this.submitId = submitId;
    this.fileName = fileName;
    this.assignmnetId = assignmentId;
    this.studentId = studentId;
    this.subjectId = subjectId;
    this.teacherId = teacherId;
    this.uploadedDate = uploadedDate;
    this.studentName = studentName;
  }

   HomeworkSubmitData.fromJson(Map<dynamic, dynamic> json) {
    fileName = json['fileName'] as String;
    assignmnetId = json['assignmnetId'] as String;
    studentId = json['studentId'] as String;
    subjectId = json['subjectId'] as String;
    teacherId = json['teacherId'] as String;
    uploadedDate = json['uploadedDate'] as String;
    studentName = json['studentName'] as String;
  }

  Map<String, Object> toJson() => <String, Object>{
        'fileName': fileName,
        'assignmnetId': assignmnetId,
        'studentId': studentId,
        'subjectId': subjectId,
        'teacherId': teacherId,
        'uploadedDate': uploadedDate,
        'studentName': studentName
      };
}
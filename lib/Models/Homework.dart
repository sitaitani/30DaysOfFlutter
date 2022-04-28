// TODO Implement this library.
import '';
class HomeworkData {
  String subject = "";
  String deadline = "";
  String fileName = "";

  HomeworkData(String subject,
   String deadline, String fileName) {
    this.subject = subject;
   this.fileName = fileName;
    this.deadline= deadline;
  }

  HomeworkData.fromJson(Map<dynamic, dynamic> json) {
    subject = json['subject'] as String;
    deadline = json['deadline'] as String;
    fileName = json['fileName'] as String;
  }

  Map<String, Object> toJson() => <String, Object>{
        'subject': subject,
        'fileName': fileName,
        'deadline': deadline,
      };
}

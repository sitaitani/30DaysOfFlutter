// TODO Implement this library.
class HomeworkData {
  String subject = "";
  String description = "";
  String deadline = "";

  HomeworkData(String subject, String description, String deadline) {
    this.subject = subject;
    this.description = description;
    this.deadline= deadline;
  }

  HomeworkData.fromJson(Map<dynamic, dynamic> json) {
    subject = json['subject'] as String;
    description = json['description'] as String;
    description = json['deadline'] as String;
  }

  Map<String, Object> toJson() => <String, Object>{
        'subject': subject,
        'description': description,
        'deadline': deadline,
      };
}

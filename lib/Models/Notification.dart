class NotificationData {
  String title = "";
  String description = "";

  NotificationData(String title, String description) {
    this.title = title;
    this.description = description;
  }

  NotificationData.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'] as String;
    description = json['description'] as String;
  }

  Map<String, Object> toJson() => <String, Object>{
        'title': title,
        'description': description,
      };
}

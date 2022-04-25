
class ReadingMaterialData {
  String title = "";
  String description = "";
  String link = "";

  ReadingMaterialData(String title, String description, String link) {
    this.title = title;
    this.description = description;
    this.link = link;
  }

  ReadingMaterialData.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'] as String;
    description = json['description'] as String;
    description = json['link'] as String;
  }

  Map<String, Object> toJson() => <String, Object>{
        'title': title,
        'description': description,
        "link": link,
      };
}

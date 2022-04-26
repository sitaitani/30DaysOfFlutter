
class ReadingMaterialData {
  String title = "";
  String description = "";
  String fileName = "";

  ReadingMaterialData(String title, String description, //String link
  ) 
  {
    this.title = title;
    this.description = description;
    this.fileName = fileName;
  }

  ReadingMaterialData.fromJson(Map<dynamic, dynamic> json) {
    title = json['title'] as String;
    description = json['description'] as String;
    fileName = json['filename'] as String;
  }

  Map<String, Object> toJson() => <String, Object>{
        'title': title,
        'description': description,
        "filename": fileName,
      };
}

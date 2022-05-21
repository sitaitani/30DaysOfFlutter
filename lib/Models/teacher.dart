import 'package:flutter/material.dart';

class Teacher {
  String id = "";
  String name = "";
  List<Subject> subjects = []; 

  Teacher(String name, String id, List<Subject> subjects) {
    this.name = name;
    this.id = id;
    this.subjects = subjects;
  }
}


class Subject {
  String id = "";
  String name = "";
  String semester = "";

  Subject(String name, String semester, String id) {
    this.name = name;
    this.semester = semester;
    this.id = id;
  }

    Subject.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'] as String;
    name = json[''] as String;
    semester = json['semester'] as String;
  }

  Map<String, Object> toJson() => <String, Object>{
        'id': id,
        'name': name,
        'semester': semester,
      };
}
import 'package:flutter/material.dart';

class Teacher {
  String name = "";
  List<Subject> subjects = []; 

  Teacher(String name, List<Subject> subjects) {
    this.name = name;
    this.subjects = subjects;
  }
}


class Subject {
  String name = "";
  String semester = "";

  Subject(String name, String semester) {
    this.name = name;
    this.semester = semester;
  }
}
import 'package:hybrid3/students.dart';
import 'dart:convert';


void main() {
  final jsonString = '''
  [
    {"first": "Conor", "last": "Mcgregor", "email": "CMoney@live.com"},
    {"first": "Dillon", "last": "Danis", "email": "mrdanis@yahoo.com"},
    {"first": "Anthony", "last": "Joshua", "email": "a-joshua@gmail.com"},
    {"first": "Khabib", "last": "Nurmagomedov", "email": "khabib@ufc.com"}
  ]
  ''';

  final jsonData = jsonDecode(jsonString);

  if (jsonData is List &&
      jsonData.isNotEmpty &&
      jsonData[0] is Map<String, dynamic>) {
    final students = Students.fromJson(jsonData);

    students
      ..sort("first")
      ..output();

    final newStudent = {
      "first": "Hadi",
      "last": "Hassan",
      "email": "hadihassan@gmail.com",
    };

    students
      ..addStudent(newStudent)
      ..output();

    students
      ..removeStudent("Danis")
      ..output();
  } else {
    print("Invalid JSON data format.");
  }
}

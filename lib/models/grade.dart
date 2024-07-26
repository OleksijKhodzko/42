import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortytwo/models/course.dart';

class Grade {
  final int grade;
  // there can be no courses for the grade
  final List<Course>? courses;

  Grade({this.courses, required this.grade});

  factory Grade.fromJson(json, CollectionReference lessonsCollection) {
    return Grade(
        grade: json['grade'],
        courses: json['courses']
            .map((json) => CourseData.fromJson(json, lessonsCollection)));
  }

  Map<String, dynamic> toJson() => {
        'grade': grade,
        'courses': courses?.map((course) => course.toJson()).toList(),
      };
}

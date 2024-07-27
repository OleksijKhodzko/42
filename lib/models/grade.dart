import 'dart:developer';

import 'package:fortytwo/models/course.dart';

class Grade {
  final int grade;
  // there can be no courses for the grade
  final List<CourseData>? courses;

  Grade({this.courses, required this.grade});

  factory Grade.fromJson(json) {
    try {
      return Grade(
          grade: json['grade'],
          courses: json['courses']
              ?.map<CourseData>((json) => CourseData.fromJson(json))
              .toList() as List<CourseData>);
    } catch (e) {
      log('Error: ${e.toString()}');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => {
        'grade': grade,
        'courses': courses?.map((course) => course.toJson()).toList(),
      };
}

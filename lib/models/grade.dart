import 'package:fortytwo/models/course.dart';

class Grade {
  final int grade;
  // there can be no courses for the grade
  final List<Course>? courses;

  Grade({this.courses, required this.grade});

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(grade: json['grade'], courses: json['courses']);
  }

  Map<String, dynamic> toJson() => {
        'grade': grade,
        'courses': courses?.map((course) => course.toJson()).toList(),
      };
}

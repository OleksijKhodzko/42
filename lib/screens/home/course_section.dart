import 'dart:developer';

import 'package:fortytwo/models/lesson.dart';

class CourseSection {
  final String title;
  final String? description;
  final List<Lesson>? lessons;

  CourseSection({required this.title, this.description, this.lessons});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'lessons': lessons?.map((lesson) => lesson.toJson()).toList(),
      };

  factory CourseSection.fromJson(json) {
    log("line 19: ${json['title']}");
    return CourseSection(
      title: json['title'],
      description: json['description'],
      lessons: json['lessons']?.map((json) => Lesson.fromJson(json))?.toList(),
    );
  }
}

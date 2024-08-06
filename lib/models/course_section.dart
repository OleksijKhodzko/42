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
    return CourseSection(
      title: json['title'],
      description: json['description'],
      lessons: json['lessons']
          ?.map<Lesson>((json) => Lesson.fromJson(json))
          ?.toList() as List<Lesson>?,
    );
  }
}

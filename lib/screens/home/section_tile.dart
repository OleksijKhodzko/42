import 'package:flutter/material.dart';
import 'package:fortytwo/screens/home/course_section.dart';
import 'package:fortytwo/screens/home/lesson_tile.dart';

class SectionTile extends StatelessWidget {
  final CourseSection section;
  const SectionTile({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(section.title),
      subtitle: Text(section.description ?? 'Поки немає опису'),
      children: section.lessons == null
          ? []
          : section.lessons!
              .map((lesson) => LessonTile(lesson: lesson))
              .toList(),
    );
  }
}

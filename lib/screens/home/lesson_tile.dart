import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';

class LessonTile extends StatelessWidget {
  final Lesson lesson;
  const LessonTile({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(lesson.title),
        subtitle: Text(lesson.description ?? 'Поки немає опису'),
        onTap: () {
          Navigator.of(context).pushNamed('/lesson_page', arguments: lesson);
        },
      );
}

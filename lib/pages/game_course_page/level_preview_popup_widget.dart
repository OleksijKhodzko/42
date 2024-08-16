import 'package:flutter/material.dart';
import 'package:fortytwo/models/course_progress.dart';
import 'package:fortytwo/models/lesson.dart';

class LessonPreviewPopupWidget extends StatelessWidget {
  final Lesson lesson;
  final LessonStats stats;
  const LessonPreviewPopupWidget(
      {super.key, required this.lesson, required this.stats});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(lesson.title),
      content: Column(
        children: [
          Text(lesson.description ?? ''),
          Text('${stats.score.toString()}%'),
        ],
      ),
      actions: const [],
    );
  }
}

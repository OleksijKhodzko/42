import 'package:flutter/material.dart';
import 'package:fortytwo/models/course_progress.dart';
import 'package:fortytwo/models/course_section.dart';

class CoursePreviewPopupWidget extends StatelessWidget {
  final CourseSection section;
  final SectionStats stats;
  const CoursePreviewPopupWidget(
      {super.key, required this.section, required this.stats});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(section.title),
      content: Column(
        children: [
          Text(section.description ?? ''),
          Text('${stats.totalSectionScore.toString()}%'),
        ],
      ),
      actions: const [],
    );
  }
}

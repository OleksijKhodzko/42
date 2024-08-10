import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';

class CourseTile extends StatelessWidget {
  final CourseData course;
  const CourseTile({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(course.title),
        subtitle: course.description == null
            ? const Text('')
            : Text(course.description!),
        trailing: const Icon(Icons.chevron_right),
      ),
      onTap: () => Navigator.pushNamed(
        context,
        '/course_content',
        arguments: course,
      ),
    );
  }
}

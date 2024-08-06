import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';

class CourseTile extends StatelessWidget {
  final CourseData course;
  final Function onTap;
  const CourseTile({super.key, required this.course, required this.onTap});

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
      onTap: () {
        onTap();
      },
    );
  }
}

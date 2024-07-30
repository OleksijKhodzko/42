import 'package:flutter/material.dart';
import 'package:fortytwo/screens/course/course_section.dart';
import 'package:fortytwo/screens/home/section_tile.dart';

class CourseContent extends StatefulWidget {
  final List<CourseSection> content;
  const CourseContent({super.key, required this.content});

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: widget.content
          .map((section) => SectionTile(section: section))
          .toList(),
    );
  }
}

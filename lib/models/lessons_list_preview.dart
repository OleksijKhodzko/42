import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';

class LessonsListPreview extends StatefulWidget {
  final List<Lesson>? lessons;
  const LessonsListPreview({super.key, required this.lessons});

  @override
  State<LessonsListPreview> createState() => _LessonsListPreviewState();
}

class _LessonsListPreviewState extends State<LessonsListPreview> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

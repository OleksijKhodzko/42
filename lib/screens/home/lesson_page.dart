import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';

class LessonPage extends StatelessWidget {
  const LessonPage({super.key});

  @override
  Widget build(BuildContext context) {
    Lesson? lesson = ModalRoute.of(context)?.settings.arguments as Lesson?;
    if (lesson == null) {
      Future.delayed(const Duration(seconds: 2)).then((value) =>
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false));
      return const Placeholder();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.title),
      ),
      body: SingleChildScrollView(
        child: Text(lesson.script),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    final lesson = ModalRoute.of(context)?.settings.arguments as Lesson?;
    return lesson == null
        ? const ErrorPage(code: '09828')
        : Scaffold(
            appBar: AppBar(
              title: Text(lesson.title),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 20,
                  child: Center(
                    child: Text(
                        lesson.description ?? 'У цього уроку поки нема опису'),
                  ),
                ),
                Expanded(
                  flex: 80,
                  child: Center(
                    child: Text(lesson.script),
                  ),
                ),
              ],
            ),
          );
  }
}

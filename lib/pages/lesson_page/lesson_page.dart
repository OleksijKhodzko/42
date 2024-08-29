import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/lesson_content.dart';

final ScrollController controller = ScrollController();

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {

  Lesson? lesson;

  @override
  Widget build(BuildContext context) {
    lesson ??= ModalRoute.of(context)?.settings.arguments as Lesson?;
    return lesson == null
        ? const ErrorPage(code: '09828')
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 189, 189, 189),
              elevation: 0.0,
              title: Text(lesson!.title, style: const TextStyle(fontSize: 20,)),
            ),
            body: ListView(
              controller: controller,
              children: const [
                Block1(),
                Block2(),
                Block3(),
                // Block4(),
                // Block5(),
                // Block6(),
                // Block7(),
                // Block8(),
                // Block9(),
              ],
            ),
        );        
  }
}
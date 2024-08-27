import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/json_logic.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/lesson_content.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {

  Lesson? lesson;
  String? _lessonJson;
  ScrollController _controller = ScrollController();

  Future<void> uploadJson() async {
    DocumentReference docRef = FirebaseFirestore.instance.collection('lessons').doc('RizWsBtbncwoiFYHo8ov');
    docRef.update({'script': _lessonJson});   
  }

  @override
  void initState() {
    super.initState();
    _lessonJson = widgetToJson(LessonContent());
    uploadJson();
  }

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
              controller: _controller,
              children: [
                LessonContent(),
              ], //fromJson(...),
            ),
        );        
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/services/database.dart';
import 'package:fortytwo/shared/loading.dart';

class CoursePreview extends StatefulWidget {
  const CoursePreview({super.key});

  @override
  State<CoursePreview> createState() => _CoursePreviewState();
}

class _CoursePreviewState extends State<CoursePreview> {
  @override
  Widget build(BuildContext context) {
    final String? uid = ModalRoute.of(context)?.settings.arguments as String?;
    // TODO: check this, probably not needed
    if (uid == null) {
      Future.delayed(const Duration(seconds: 2)).then((value) =>
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false));
      return const Placeholder();
    }
    final course = CourseDatabase(uid: uid).course;
    return StreamBuilder<CourseData?>(
        stream: course,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          if (snapshot.hasError) {
            return const Text('Щось пішло не так');
          }
          if (!snapshot.hasData) {
            return const Text('Цей курс ще не доступний, або сталась помилка');
          }
          CourseData course = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text(course.title),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Expanded(
                    flex: 20,
                    child: SingleChildScrollView(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              course.description ??
                                  'У цього курсу немає опису.',
                              style: const TextStyle(
                                fontSize: 17,
                              )),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 80,
                    child: Placeholder(),
                  )
                ],
              ),
            ),
          );
        });
  }
}

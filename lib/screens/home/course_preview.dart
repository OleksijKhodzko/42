import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';

class CoursePreview extends StatefulWidget {
  const CoursePreview({super.key});

  @override
  State<CoursePreview> createState() => _CoursePreviewState();
}

class _CoursePreviewState extends State<CoursePreview> {
  @override
  Widget build(BuildContext context) {
    final CourseData? course =
        ModalRoute.of(context)?.settings.arguments as CourseData?;
    // TODO: check this, probably not needed
    // actually, this is only for hot reload
    if (course == null) {
      Future.delayed(const Duration(seconds: 2)).then((value) =>
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false));
      return const Placeholder();
    }
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
                    child:
                        Text(course.description ?? 'У цього курсу немає опису.',
                            style: const TextStyle(
                              fontSize: 17,
                            )),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 80,
              child: Text(course.toJson().toString()),
            )
          ],
        ),
      ),
    );
  }
}

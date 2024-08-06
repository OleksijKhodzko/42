import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/pages/course_content_page/section_tile.dart';

class CourseContentPage extends StatefulWidget {
  const CourseContentPage({super.key});

  @override
  State<CourseContentPage> createState() => _CourseContentPageState();
}

class _CourseContentPageState extends State<CourseContentPage> {
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
        // title: Padding(
        //   // you can forcefully translate values left side using Transform
        //   padding: const EdgeInsets.only(left: 40.0),
        title: Text(course.title),
        // ),
        // centerTitle: false,
        // titleSpacing: 0.0,
        // leadingWidth: 0,
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
              // child: Text(course.toJson().toString()),
              child: course.content == null
                  ? const Text('Поки у цього курсу немає змісту')
                  : ListView(
                      children: course.content!
                          .map((section) => SectionTile(section: section))
                          .toList(),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

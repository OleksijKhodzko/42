import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/pages/game_course_page/chained_levels_map.dart';

class GameCoursePage extends StatelessWidget {
  final Course? lastCourse;
  const GameCoursePage({super.key, this.lastCourse});

  @override
  Widget build(BuildContext context) {
    final course =
        lastCourse ?? ModalRoute.of(context)?.settings.arguments as Course?;
    if (course == null || course.data.content == null) {
      return const ErrorPage(code: '98738');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(course.data.title),
        leading: InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/saved_courses', (route) => false);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Text(course.data.content.toString()),
          Text(course.progress.toString()),
          SingleChildScrollView(
            child: ChainedLevelsMap(content: course.data.content!),
            // child: Column(
            //   children: course.data.content
            //           ?.map((section) =>
            //               CourseSectionGameWidget(section: section))
            //           .toList() ??
            //       [const ErrorPage(code: '77777')],
            // ),
          ),
          // floatingActionButton: FloatingActionButton(
          //     backgroundColor: Colors.black,
          //     child: const Icon(
          //       Icons.bolt,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       //Just to visually see the change of path's curve.
          //     }),
        ],
      ),
    );
  }
}

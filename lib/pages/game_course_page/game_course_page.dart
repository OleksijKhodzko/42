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
          Expanded(
            child: ChainedLevelsMap(
              course: course,
              // course: Course(
              //   data: CourseData(
              //     title: 'Course',
              //     content: [
              //       CourseSection(
              //         title: 'Section 1',
              //         lessons: [
              //           Lesson(
              //             title: 'Lesson 1',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //         ],
              //       ),
              //       CourseSection(
              //         title: 'Section 1',
              //         lessons: [
              //           Lesson(
              //             title: 'Lesson 1',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //         ],
              //       ),
              //       CourseSection(
              //         title: 'Section 1',
              //         lessons: [
              //           Lesson(
              //             title: 'Lesson 1',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //         ],
              //       ),
              //       CourseSection(
              //         title: 'Section 1',
              //         lessons: [
              //           Lesson(
              //             title: 'Lesson 1',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 1',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 1',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //         ],
              //       ),
              //       CourseSection(
              //         title: 'Section 1',
              //         lessons: [
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //           Lesson(
              //             title: 'Lesson 2',
              //             description: 'Description',
              //             script: 'Script',
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              //   uid: '',
              //   progress: CourseProgress(),
              // ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

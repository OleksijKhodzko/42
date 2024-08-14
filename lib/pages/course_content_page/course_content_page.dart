import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/pages/course_content_page/section_tile.dart';
import 'package:fortytwo/services/database.dart';
import 'package:provider/provider.dart';

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
        actions: [
          ElevatedButton(
            onPressed: () {
              // updateUserData and go to the corresponding gamified page
              final user = Provider.of<UserData?>(context, listen: false);
              if (user != null) {
                final courseString = course.toString();
                bool courseSaved = false;
                for (Course userCourse in user.courses ?? []) {
                  if (courseString == userCourse.toString()) courseSaved = true;
                }
                if (courseSaved) {
                  final database =
                      Provider.of<UserDatabase>(context, listen: false);
                  database.updateUserData(courses: [
                    Course(
                      uid: DateTime.now().millisecondsSinceEpoch.toString(),
                      data: course,
                      progress: CourseProgress(),
                    ),
                    // this means that if user.courses exist, all its content is
                    // added here
                    ...?user.courses,
                  ], premium: user.premium);
                }
              }
              Navigator.pushNamed(
                context,
                '/game_course_page',
                arguments: course,
              );
            },
            child: const Icon(Icons.play_lesson),
          ),
          const SizedBox(width: 30),
        ],

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

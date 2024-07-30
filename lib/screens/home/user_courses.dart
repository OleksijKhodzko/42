import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/screens/course/course_tile.dart';
import 'package:provider/provider.dart';

class UserCourses extends StatefulWidget {
  const UserCourses({super.key});

  @override
  State<UserCourses> createState() => _UserCoursesState();
}

class _UserCoursesState extends State<UserCourses> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData?>(context);
    if (user == null) {
      return const Text('Вам потрібно зареєструватися');
    }
    if (user.courses == null) {
      return const Text('Ви ще не маєте вибраних курсів');
    }
    return ListView(
      children: user.courses!
          .map((course) => CourseTile(course: course.data))
          .toList(),
    );
  }
}

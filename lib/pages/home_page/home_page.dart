import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/pages/game_course_page/game_course_page.dart';
import 'package:fortytwo/pages/grades_page/grades_page.dart';
import 'package:fortytwo/pages/log_in_page/log_in_page.dart';
import 'package:fortytwo/pages/saved_courses_page/saved_courses_page.dart';
import 'package:fortytwo/services/cache.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserData? user;
  late Future<Course?> lastCourse;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserData? user = Provider.of<UserData?>(context);
    CacheService cache = Provider.of<CacheService>(context);
    Future<Course?> lastCourse = cache.lastCourse;
    if (user == null) return const LogInPage();
    return FutureBuilder(
        future: lastCourse,
        builder: (context, lastCourseSnapshot) {
          Course? lastCourse = lastCourseSnapshot.data;
          if (lastCourse == null) {
            if (user.courses == null) {
              return const GradesPage();
            } else {
              return const SavedCoursesPage();
            }
          } else {
            return GameCoursePage(lastCourse: lastCourse);
          }
        });
  }
}

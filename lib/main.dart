import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fortytwo/pages/course_content_page/course_content_page.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/pages/game_course_page/game_course_page.dart';
import 'package:fortytwo/pages/grade_courses_page/grade_courses_page.dart';
import 'package:fortytwo/pages/home_page/home_page.dart';
import 'package:fortytwo/pages/log_in_page/log_in_page.dart';
import 'package:fortytwo/pages/sign_up_page/sign_up_page.dart';
import 'package:fortytwo/wrappers/wrapper.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> clearPrefs() async {
  if (kDebugMode) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: (context, widget) => DevicePreview.appBuilder(
        context,
        widget == null ? const ErrorPage(code: '9951') : Wrapper(child: widget),
      ),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        '/': (context) => const HomePage(),
        '/log_in': (context) => const LogInPage(),
        '/sign_up': (context) => const SignUpPage(),
        '/grade_courses': (context) => const GradeCoursesPage(),
        '/course_content': (context) => const CourseContentPage(),
        '/game_course_page': (context) => const GameCoursePage(),
      },
    );
  }
}

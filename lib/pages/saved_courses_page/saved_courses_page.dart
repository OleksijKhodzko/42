import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/pages/grade_courses_page/course_tile.dart';
import 'package:fortytwo/shared_widgets/avatar_widget.dart';
import 'package:provider/provider.dart';

class SavedCoursesPage extends StatefulWidget {
  const SavedCoursesPage({super.key});

  @override
  State<SavedCoursesPage> createState() => _SavedCoursesPageState();
}

class _SavedCoursesPageState extends State<SavedCoursesPage> {
  Widget? bodyWidget;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData?>(context);
    if (user == null) {
      bodyWidget = Text('You should be registered to access this page.');
    } else if (user.courses == null) {
      // TODO: create a shared widget to display text in
      //  a nice way in the center of the screen
      bodyWidget = Center(
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: Container(),
            ),
            const Expanded(
              flex: 20,
              child: Text(
                'У вас поки немає обраних курсів',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(),
            ),
          ],
        ),
      );
    } else {
      bodyWidget = ListView(
        children: user.courses!
            .map((Course course) =>
                CourseTile(course: course.data, onTap: () {}))
            .toList(), //as List<Widget>,
      );
    }

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {},
                child: const UserAvatar()),
            Expanded(
              flex: 60,
              child: Container(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/grades');
                },
                child: const SizedBox(
                    width: 48, height: 48, child: Icon(Icons.search, size: 40)),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
      body: bodyWidget ?? ErrorPage(code: '23456'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fortytwo/models/course_section.dart';

class CourseSectionGameWidget extends StatelessWidget {
  final CourseSection section;
  const CourseSectionGameWidget({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    // return Text(section.toJson().toString());
    return ElevatedButton(
      child: Text(section.title),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

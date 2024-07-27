import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/grade.dart';
import 'package:fortytwo/screens/home/course_tile.dart';
import 'package:fortytwo/services/database.dart';
import 'package:fortytwo/shared/loading.dart';

class GradeCourse extends StatefulWidget {
  const GradeCourse({super.key});

  @override
  State<GradeCourse> createState() => _GradeCourseState();
}

class _GradeCourseState extends State<GradeCourse> {
  @override
  Widget build(BuildContext context) {
    final String? grade = ModalRoute.of(context)?.settings.arguments as String?;
    // only used for hot reload
    if (grade == null) {
      Future.delayed(const Duration(seconds: 2)).then((value) =>
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false));
    }

    return StreamBuilder<Grade?>(
        stream: GradeDatabase(uid: grade!).grade,
        builder: (BuildContext context, AsyncSnapshot<Grade?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }
          Widget bodyWidget;
          if (snapshot.hasError) {
            // TODO: create error widget
            log('line 44: ${snapshot.data}');
            log(snapshot.toString());
            log(snapshot.error.toString());
            bodyWidget = const Text('Щось пішло не так');
          } else if (!snapshot.hasData) {
            // TODO: create a widget for not awailable course
            bodyWidget =
                const Text('Цей курс ще не доступний, або сталась помилка');
          } else {
            Grade gradeInstance = snapshot.data!;
            bodyWidget = ListView.builder(
              itemCount: gradeInstance.courses?.length,
              itemBuilder: (BuildContext context, int index) {
                // return ListTile(
                //   title: Text(
                //       gradeInstance.courses?[index].toJson().toString() ??
                //           'no course data'),
                // );
                return gradeInstance.courses == null
                    ? const Text('no course data')
                    : CourseTile(course: gradeInstance.courses![index]);
              },
            );
          }
          return Scaffold(
            appBar: AppBar(title: Text('${snapshot.data?.grade} клас')),
            body: bodyWidget,
          );
        });
  }
}

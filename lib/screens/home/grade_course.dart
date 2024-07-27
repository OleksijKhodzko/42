import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/grade.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text('$grade клас')),
      body: StreamBuilder<Grade?>(
          stream: GradeDatabase(uid: grade!).grade,
          builder: (BuildContext context, AsyncSnapshot<Grade?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            }
            if (snapshot.hasError) {
              // TODO: create error widget
              log('line 44: ${snapshot.data}');
              log(snapshot.toString());
              log(snapshot.error.toString());
              return const Text('Щось пішло не так');
            }
            if (!snapshot.hasData) {
              // TODO: create a widget for not awailable course
              return const Text(
                  'Цей курс ще не доступний, або сталась помилка');
            }
            Grade gradeInstance = snapshot.data!;
            log('line 44: ${gradeInstance.courses?.length}');
            return ListView.builder(
              itemCount: gradeInstance.courses?.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      gradeInstance.courses?[index].toJson().toString() ??
                          'no course data'),
                );
              },
            );
          }),
    );
  }
}

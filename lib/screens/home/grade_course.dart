import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fortytwo/services/database.dart';

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
    Stream<DocumentSnapshot> gradeStream =
        DatabaseService().gradesCollection.doc(grade).snapshots();
    // return Scaffold(
    //   appBar: AppBar(title: Text('$grade клас')),
    //   body: StreamBuilder<DocumentSnapshot>(
    //       initialData: null,
    //       stream: gradeStream,
    //       builder: (context, snapshot) {
    //         if (snapshot.data == null || !snapshot.data!.exists) {
    //           return const Placeholder();
    //         }
    //         return ListView.builder(
    //           itemCount: snapshot.data!['courses'].length,
    //           itemBuilder: (BuildContext context, int index) {
    //             return ListTile(
    //               title: Text(snapshot.data!['courses'][index]),
    //             );
    //           },
    //         );
    //       }),
    // );
    // TODO put scaffold in the stream builder
    return Scaffold(
      appBar: AppBar(title: Text('$grade клас')),
      body: StreamBuilder<DocumentSnapshot>(
          initialData: null,
          stream: gradeStream,
          builder: (context, snapshot) {
            if (snapshot.data == null || !snapshot.data!.exists) {
              return const Placeholder();
            }
            return ListView.builder(
              itemCount: snapshot.data!['courses'].length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data!['courses'][index]),
                );
              },
            );
          }),
    );
  }
}

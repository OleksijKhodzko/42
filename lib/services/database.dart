import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/grade.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/models/user.dart';

class DatabaseService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference coursesCollection =
      FirebaseFirestore.instance.collection('courses');

  final CollectionReference lessonsCollection =
      FirebaseFirestore.instance.collection('lessons');

  final CollectionReference gradesCollection =
      FirebaseFirestore.instance.collection('grades');
}

class UserDatabase {
  final String uid;
  late DocumentReference doc;
  UserDatabase({required this.uid}) {
    doc = FirebaseFirestore.instance.collection('users').doc(uid);
  }

  Future<void> updateUserData(List<Course>? courses, bool premium) async {
    return await doc
        .set(UserData(uid: uid, premium: premium, courses: courses).toJson());
  }

  Stream<UserData?> get userData {
    return doc.snapshots().map((snapshot) {
      if (!snapshot.exists) {
        log('User not found: $uid');
        return null;
      }
      return UserData.fromJson(snapshot.data());
    });
  }
}

class GradeDatabase {
  final String uid;
  late DocumentReference doc;
  GradeDatabase({required this.uid}) {
    doc = FirebaseFirestore.instance.collection('grades').doc(uid);
  }

  Stream<Grade?> get grade async* {
    Stream<DocumentSnapshot> gradeSnapshots = doc.snapshots();
    await for (DocumentSnapshot gradeSnapshot in gradeSnapshots) {
      if (!gradeSnapshot.exists) {
        log('Grade not found: $uid');
        yield null;
      } else {
        Map<String, dynamic> gradeJson =
            gradeSnapshot.data() as Map<String, dynamic>;
        // gradeJson['courses'] = gradeJson['courses']
        //     .map((course) async => await course.get())
        //     .toList();
        List<Map<String, dynamic>> coursesList = [];
        // for (DocumentReference courseReference in gradeJson['courses']) {
        for (int i = 0; i < gradeJson['courses'].length; i++) {
          DocumentReference courseReference = gradeJson['courses'][i];
          final courseJson = await courseReference.get();
          List<List<DocumentSnapshot>> content = [];
          // for (int sectionIndex in courseJson['content']) {
          for (int j = 0; j < courseJson['content'].length; j++) {
            String sectionIndex = courseJson['content'].keys.toList()[j];
            List<DocumentSnapshot> lessonsList = [];
            for (DocumentReference lessonReference in courseJson['content']
                [sectionIndex]['lessons']) {
              lessonsList.add(await lessonReference.get());
            }
            content.add(lessonsList);
          }
          coursesList.add({
            'title': courseJson['title'],
            'description': courseJson['description'],
            'content': content
          });
        }
        gradeJson['courses'] = coursesList;

        // gradeJson['courses'] = gradeJson['courses']
        //     .map((_Doc))
        //     .toList();
        yield Grade.fromJson(gradeJson);
      }
    }
  }

  //   return doc.snapshots().map((snapshot) {
  //     if (!snapshot.exists) {
  //       log('Grade not found: $uid');
  //       return null;
  //     }
  //     Map<String, dynamic> gradeJson = snapshot.data() as Map<String, dynamic>;
  //     for (DocumentReference course in gradeJson['courses']) {
  //       gradeJson['courses'] =  course.get();
  //     }
  //     return Grade.fromJson(gradeJson);
  //   });
  // }
}

class CourseDatabase {
  final String uid;
  late DocumentReference doc;
  CourseDatabase({required this.uid}) {
    doc = FirebaseFirestore.instance.collection('courses').doc(uid);
  }

  Stream<CourseData?> get course async* {
    Stream<DocumentSnapshot> courseSnapshots = doc.snapshots();
    await for (DocumentSnapshot courseSnapshot in courseSnapshots) {
      if (!courseSnapshot.exists) {
        log('Course not found: $uid');
        yield null;
      } else {
        Map<String, dynamic> courseJson =
            courseSnapshot.data() as Map<String, dynamic>;
        if (courseJson.containsValue('content')) {
          // for (int i = 0; i < courseJson['content'].length; i++) {
          //   List<DocumentSnapshot> lessonsList = [];
          //   for (DocumentReference courseReference in courseJson['content']
          //       [i]) {
          //     lessonsList.add(await courseReference.get());
          //   }
          //   courseJson['content'][i] = lessonsList;
          // }
          List<List<DocumentSnapshot>> content = [];
          // courseJson['content'] is a map like this:
          // {
          // '1': {
          //   lessons: [_jsonDocumentSnapshot1, _jsonDocumentSnapshot2, ...],
          //   title: "Розділ 1"
          //  }
          // '2': {
          //  ...
          // }, ...
          // }
          // it is map instead of 2d array, because nested arrays
          // are impossible in firebase
          for (int sectionIndex in courseJson['content']) {
            List<DocumentSnapshot> lessonsList = [];
            for (DocumentReference lessonReference in courseJson['content']
                [sectionIndex]['lessons']) {
              lessonsList.add(await lessonReference.get());
            }
            content.add(lessonsList);
          }
          courseJson['content'] = content;
        }
        yield CourseData.fromJson(courseJson);
      }
    }
  }
}

class LessonDatabase {
  final String uid;
  late DocumentReference doc;
  LessonDatabase({required this.uid}) {
    doc = FirebaseFirestore.instance.collection('lessons').doc(uid);
  }

  Stream<Lesson?> get lesson {
    return doc.snapshots().map((snapshot) {
      if (!snapshot.exists) {
        log('Lesson not found: $uid');
        return null;
      }
      return Lesson.fromJson(snapshot.data());
    });
  }
}

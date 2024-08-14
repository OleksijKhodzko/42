import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/grade.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/services/cache.dart';

Future<Map<String, dynamic>?> courseJsonFromSnapshot(
    DocumentSnapshot courseSnapshot) async {
  Map<String, dynamic> courseJson =
      courseSnapshot.data() as Map<String, dynamic>;
  if (courseJson.containsKey('content')) {
    List<Map<String, dynamic>> content = [];
    // courseJson['content'] is a map like this:
    // {
    // '1': {
    //   lessons: [_jsonDocumentSnapshot1, _jsonDocumentSnapshot2, ...],
    //   title: "Розділ 1"
    //   description: "Основні поняття в мові Swift"
    //  }
    // '2': {
    //  ...
    // }, ...
    // }
    // it is map instead of 2d array, because nested arrays
    // are impossible in firebase
    for (String sectionIndex in courseJson['content'].keys) {
      List<Map<String, dynamic>> lessonsList = [];
      final lessons = courseJson['content'][sectionIndex]['lessons'];
      for (int i = 0; i < lessons.length; i++) {
        lessonsList
            .add((await lessons[i].get()).data() as Map<String, dynamic>);
      }
      Map<String, dynamic> section = courseJson['content'][sectionIndex];
      section['lessons'] = lessonsList;
      content.add(section);
    }
    courseJson['content'] = content;
    return courseJson;
  }
  return {
    'title': courseJson['title'],
    'description': courseJson['description'],
    'content': null,
  };
}

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
  // TODO: remake this somehow so that premium parameter is not required
  Future<void> updateUserData(
      {List<Course>? courses, required bool premium, String? avatarUrl}) async {
    UserData user = UserData(
        uid: uid, premium: premium, courses: courses, avatarUrl: avatarUrl);
    await doc.set(user.toJson());
    CacheService().cacheUserData(user);
  }

  Stream<UserData?> get userData async* {
    try {
      UserData? cachedUserData = await CacheService().user;
      if (cachedUserData != null) {
        yield cachedUserData;
      } else {
        yield* doc.snapshots().map((snapshot) {
          if (!snapshot.exists || snapshot.data() == null) {
            log('User not found: $uid');
            return null;
          }
          return UserData.fromJson(snapshot.data());
        });
      }
    } catch (e) {
      log('Error in databse Stream<UserData?> userData in UserDatabase:\n$e');
      print('Error in databse Stream<UserData?> userData in UserDatabase:\n$e');
    }
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
        // Example of gradeJson:
        // {
        //  'courses': [_jsonDocumentSnapshot1, _jsonDocumentSnapshot2, ...],
        //  'grade': 5,
        // }
        Map<String, dynamic> gradeJson =
            gradeSnapshot.data() as Map<String, dynamic>;
        List<Map<String, dynamic>?> coursesList = [];
        for (int i = 0; i < gradeJson['courses'].length; i++) {
          DocumentReference courseReference =
              gradeJson['courses'][i] as DocumentReference;
          DocumentSnapshot courseSnapshot = await courseReference.get();
          coursesList.add(await courseJsonFromSnapshot(courseSnapshot));
        }
        gradeJson['courses'] = coursesList;
        yield Grade.fromJson(gradeJson);
      }
    }
  }
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
        Map<String, dynamic>? courseJson =
            await courseJsonFromSnapshot(courseSnapshot);
        yield courseJson == null ? null : CourseData.fromJson(courseJson);
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

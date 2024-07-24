import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/user.dart';

class UserDatabase {
  final String uid;
  UserDatabase({required this.uid});

  final CollectionReference coursesCollection =
      FirebaseFirestore.instance.collection('courses');

  final CollectionReference lessonsCollection =
      FirebaseFirestore.instance.collection('lessons');

  Future<void> updateUserData(List<Course>? courses, bool premium) async {
    return await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'courses': courses == null
          ? []
          : courses.map((Course course) => course.toJson()),
      'premium': premium,
    });
  }

  Stream<UserData?> get userData {
    try {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .snapshots()
          .map((snapshot) {
        if (snapshot.exists) {
          return UserData.fromJson(snapshot.data(), lessonsCollection);
        } else {
          return null;
        }
      });
    } catch (e) {
      log('Error in database get userData');
      throw Exception(e);
    }
  }
}

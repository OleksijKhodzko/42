import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fortytwo/models/lesson.dart';

// represents global course data,
// common to all users
class CourseData {
  final String uid;
  final String title;
  final String? description;
  final List<Lesson>? lessons;

  CourseData(
      {required this.title, this.description, this.lessons, required this.uid});

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
        'description': description,
        'lessons': lessons?.map((lesson) => lesson.toJson()).toList(),
      };

  factory CourseData.fromJson(DocumentSnapshot json) {
    log('line 25: ${json['lessons'].toString()}');
    log('line 26: ${json['lessons'] == null}');
    log('line 27: ${json['lessons'] == "null"}');
    log('line 28: ${json['lessons']?.map((json) => Lesson.fromJson(json)).toList()}');
    return CourseData(
      // uid: json['uid'],
      // title: json['title'],
      // description: json['description'],
      // lessons:
      //     json['lessons'].map((lesson) => Lesson.fromJson(lesson)).toList());
      uid: json['uid'],
      title: json['title'],
      description: json['description'],
      lessons: json['lessons']?.map((json) => Lesson.fromJson(json))?.toList(),
    );
  }
}

class LessonStatistics {
  final int? score;
  LessonStatistics({this.score});

  Map<String, dynamic> toJson() => {
        'score': score,
      };
}

class CourseProgress {
  final int? overallProgress; // progress of the course
  final int? currentLesson;
  final Map<int, LessonStatistics>? lessons; // statistics for all the lessons
  CourseProgress({this.currentLesson, this.lessons, this.overallProgress});

  factory CourseProgress.fromJson(json) => CourseProgress(
      overallProgress: json['overallProgress'],
      currentLesson: json['currentLesson'],
      lessons: json['lessons'].map(
        (index, lesson) => MapEntry(index, lesson.toJson()),
      ));

  Map<String, dynamic> toJson() => {
        'overallProgress': overallProgress,
        'currentLesson': currentLesson,
        'lessons': lessons?.map((key, value) => MapEntry(key, value.toJson())),
      };
}

// represents a course taken
// by the specific user
class Course {
  final String uid;
  final CourseData data;
  final CourseProgress progress;

  Course({required this.uid, required this.data, required this.progress});

  factory Course.fromJson(json) => Course(
      uid: json['uid'],
      data: CourseData.fromJson(json['data']),
      progress: CourseProgress.fromJson(json['progress']));

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'data': data.toJson(),
        'progress': progress.toJson(),
      };
}

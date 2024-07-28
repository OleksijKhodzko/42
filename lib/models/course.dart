import 'package:fortytwo/screens/home/course_section.dart';

// represents global course data,
// common to all users
class CourseData {
  final String title;
  final String? description;
  final List<CourseSection>? contens;

  CourseData({required this.title, this.description, this.contens});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'contens': contens?.map((section) => section.toJson()).toList(),
      };

  factory CourseData.fromJson(json) {
    return CourseData(
      title: json['title'],
      description: json['description'],
      contens: json['contens']
          ?.map((json) => CourseSection.fromJson(json))
          ?.toList(),
    );
  }
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

// TODO: add lesson statistics
class LessonStatistics {
  final int? score;
  LessonStatistics({this.score});

  Map<String, dynamic> toJson() => {
        'score': score,
      };
}

// TODO: remake this class to add sections
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

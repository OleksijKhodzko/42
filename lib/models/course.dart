// represents global course data,
// common to all users
import 'package:fortytwo/models/course_section.dart';
import 'package:fortytwo/models/course_progress.dart';

class CourseData {
  final String title;
  final String? description;
  final List<CourseSection>? content;

  CourseData({required this.title, this.description, this.content});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'content': content?.map((section) => section.toJson()).toList(),
      };

  factory CourseData.fromJson(json) {
    return CourseData(
      title: json['title'],
      description: json['description'],
      content: json['content']
          ?.map<CourseSection>((json) => CourseSection.fromJson(json))
          ?.toList() as List<CourseSection>?,
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

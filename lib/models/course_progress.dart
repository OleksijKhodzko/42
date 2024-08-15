class LessonStats {
  int? score;
  LessonStats({this.score});
  Map<String, dynamic> toJson() => {
        'score': score,
      };
  factory LessonStats.fromJson(json) => LessonStats(
        score: json['score'],
      );
}

class SectionStats {
  // max is 100, null means the section is not started yet
  final int? totalSectionScore;
  // null means the section is finished
  final int? currentLessonIndex;
  // List<LessonStats> lessons - list of progress objects for each lesson in section
  // (amount of elements in this list should be less or equal to the amount
  // of lessons in section. If length of this list is less then the amount of
  // lessons, it means that all the lessons with no corresponding LessonStats
  // are unfinished yet)
  final List<LessonStats> lessons;

  SectionStats(
      {this.lessons = const [],
      this.currentLessonIndex,
      this.totalSectionScore});

  Map<String, dynamic> toJson() => {
        'totalSectionScore': totalSectionScore,
        'currentLessonIndex': currentLessonIndex,
        'lessons': lessons.map((lessonStats) => lessonStats.toJson()),
      };

  factory SectionStats.fromJson(json) => SectionStats(
        totalSectionScore: json['totalSectionScore'],
        currentLessonIndex: json['currentLessonIndex'],
        lessons: json['lessons'],
      );
}

// TODO: remake this class to add sections
class CourseProgress {
  final int? overallProgress; // progress of the course
  final int? currentSection;
  final int? currentLesson;
  final Map<int, SectionStats>? sections; // statistics for all the lessons

  CourseProgress(
      {this.currentSection,
      this.currentLesson,
      this.sections,
      this.overallProgress});

  factory CourseProgress.fromJson(json) => CourseProgress(
      overallProgress: json['overallProgress'],
      currentLesson: json['currentLesson'],
      sections: json['lessons']?.map(
        (index, lesson) => MapEntry(index, lesson.toJson()),
      ));

  Map<String, dynamic> toJson() => {
        'overallProgress': overallProgress,
        'currentLesson': currentLesson,
        'lessons': sections?.map((key, value) => MapEntry(key, value.toJson())),
      };
}

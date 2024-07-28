// in firebase lessons are stored in
// explicit document so that the same lesson
// can be used in different courses
class Lesson {
  final String title;
  final String? description;
  final String script;

  Lesson({required this.title, this.description, required this.script});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'script': script,
      };

  factory Lesson.fromJson(dynamic json) => Lesson(
      title: json['title'],
      description: json['description'],
      script: json['script']);
}

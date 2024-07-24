import 'package:fortytwo/models/course.dart';

// mostly for authentication
class UserObject {
  final String uid;
  UserObject({required this.uid});
}

class UserData {
  final String uid;
  final List<Course>? courses;
  final bool premium;
  final String? avatarUrl;

  UserData(
      {required this.uid, this.courses, required this.premium, this.avatarUrl});

  factory UserData.fromJson(json, lessonsCollection) => UserData(
        uid: json['uid'],
        courses: json['courses']
            .map((Map<String, dynamic> course) =>
                Course.fromJson(course, lessonsCollection))
            .toList(),
        // courses: snapshot.get('courses').map((String uid) async {
        //   _courseFromSnapshot(await coursesCollection.doc(uid).get());
        // }),
        premium: json['premium'],
        avatarUrl: json['avatarUrl'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'courses': courses?.map((course) => course.toJson()).toList(),
        'premium': premium,
        'avatarUrl': avatarUrl,
      };
}

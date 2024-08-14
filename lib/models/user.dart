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

  // TODO: fix the processing of the 'courses' field
  // TODO: somehove implement catching errors
  //  (probably in the databse class, not here)
  factory UserData.fromJson(json) => UserData(
        uid: json['uid'],
        courses: json['courses']
            ?.map<Course>((course) => Course.fromJson(course))
            ?.toList(),
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

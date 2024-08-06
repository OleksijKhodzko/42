import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/user.dart';
import 'package:json_cache/json_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  Future<Map<String, dynamic>?> _getCache(String key) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return JsonCacheMem(JsonCacheSharedPreferences(sharedPrefs)).value(key);
  }

  Future<void> _setCache(String key, Map<String, dynamic> json) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    JsonCacheMem(JsonCacheSharedPreferences(sharedPrefs)).refresh(key, json);
  }

  Future<void> cacheUserData(UserData user) => _setCache('user', user.toJson());

  Future<UserData?> get user async {
    Map<String, dynamic>? user = await _getCache('user');
    return user == null ? null : UserData.fromJson(user);
  }

  Future<Course?> get lastCourse async {
    Map<String, dynamic>? lastCourse = await _getCache('lastCourse');
    return lastCourse == null ? null : Course.fromJson(lastCourse);
  }
}

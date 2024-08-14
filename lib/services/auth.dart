import 'dart:developer';

import 'package:fortytwo/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fortytwo/services/cache.dart';
import 'package:fortytwo/services/database.dart';

// TODO: add caching to authentication
class AuthService {
  // var which represents auth for current session
  final _auth = FirebaseAuth.instance;

  UserObject? _userFromFirebaseUser(User? user) {
    try {
      return user == null ? null : UserObject(uid: user.uid);
    } catch (e) {
      log('UserSnapshotFromFirebase: $user');
      log(e.toString());
      return null;
    }
  }

  // stream which provides user object when auth state is changed
  Stream<UserObject?> get user async* {
    UserData? cachedUser = await CacheService().user;
    if (cachedUser == null) {
      yield* _auth.authStateChanges().map(_userFromFirebaseUser);
    } else {
      yield UserObject(uid: cachedUser.uid);
    }
  }

  Future<UserObject?> signInWithEmailAndPassword(
      String email, String password) async {
    return _userFromFirebaseUser((await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user);
  }

  Future<UserObject?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserObject? user = _userFromFirebaseUser((await _auth
            .createUserWithEmailAndPassword(email: email, password: password))
        .user);
    if (user == null) {
      return null;
    }
    UserDatabase(uid: user.uid).updateUserData(courses: null, premium: false);
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

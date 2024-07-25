import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/screens/home/grades_grid.dart';
import 'package:fortytwo/screens/home/home_app_bar.dart';
import 'package:fortytwo/services/database.dart';
import 'package:fortytwo/shared/loading.dart';
import 'package:provider/provider.dart';

class Grades extends StatefulWidget {
  const Grades({super.key});

  @override
  State<Grades> createState() => _GradesState();
}

class _GradesState extends State<Grades> {
  @override
  Widget build(BuildContext context) {
    UserObject? userObject = Provider.of<UserObject?>(context);
    if (userObject == null) return const Loading();
    final database = UserDatabase(uid: userObject.uid);
    // if (database.userData == null) throw Exception('no users document');
    return StreamProvider<UserData?>.value(
      value: database.userData,
      initialData: null,
      child: const Scaffold(
        appBar: HomeAppBar(),
        body: Padding(padding: EdgeInsets.all(30), child: GradesGrid()),
      ),
    );
  }
}

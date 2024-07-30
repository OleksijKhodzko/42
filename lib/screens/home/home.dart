import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/screens/home/home_app_bar.dart';
import 'package:fortytwo/services/database.dart';
import 'package:fortytwo/shared/loading.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final Widget child;
  const Home({super.key, required this.child});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    UserObject? userObject = Provider.of<UserObject?>(context);
    if (userObject == null) return const Loading();
    final database = UserDatabase(uid: userObject.uid);
    return StreamProvider<UserData?>.value(
      value: database.userData,
      initialData: null,
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: Padding(padding: const EdgeInsets.all(30), child: widget.child),
      ),
    );
  }
}

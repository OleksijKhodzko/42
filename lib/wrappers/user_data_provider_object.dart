import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/services/database.dart';
import 'package:provider/provider.dart';

class UserDataProviderWrapper extends StatefulWidget {
  final Widget child;
  const UserDataProviderWrapper({super.key, required this.child});

  @override
  State<UserDataProviderWrapper> createState() =>
      _UserDataProviderWrapperState();
}

class _UserDataProviderWrapperState extends State<UserDataProviderWrapper> {
  @override
  Widget build(BuildContext context) {
    UserDatabase database = Provider.of<UserDatabase>(context);
    return StreamProvider<UserData?>.value(
      value: database.userData,
      initialData: null,
      child: widget.child,
    );
  }
}

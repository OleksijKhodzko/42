import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/screens/authenticate/authenticate.dart';
import 'package:fortytwo/screens/grade/grades.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    UserObject? user = Provider.of<UserObject?>(context);
    return user == null ? const Authenticate() : const Grades();
  }
}

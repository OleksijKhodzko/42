import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/services/auth.dart';
import 'package:fortytwo/wrappers/user_database_provider.dart';
import 'package:provider/provider.dart';

class UserObjectProviderWrapper extends StatelessWidget {
  final Widget child;
  const UserObjectProviderWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);
    return StreamProvider<UserObject?>.value(
      value: auth.user,
      initialData: null,
      child: UserDatabseProviderWrapper(key: UniqueKey(), child: child),
    );
  }
}

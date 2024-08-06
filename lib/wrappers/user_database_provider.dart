import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/services/database.dart';
import 'package:fortytwo/wrappers/user_data_provider_object.dart';
import 'package:provider/provider.dart';

class UserDatabseProviderWrapper extends StatelessWidget {
  final Widget child;
  const UserDatabseProviderWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    UserObject? user = Provider.of<UserObject?>(context);
    return user == null
        ? child
        : Provider<UserDatabase>.value(
            value: UserDatabase(uid: user.uid),
            child: UserDataProviderWrapper(key: UniqueKey(), child: child),
          );
  }
}

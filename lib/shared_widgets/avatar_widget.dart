import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:provider/provider.dart';

class UserAvatar extends StatefulWidget {
  // this widget tries to load personal users'
  // avatar from firebase. If it fails, it sets default
  // avatar from asset and each 3 minutes tries to load default
  // avatar from firebase. When it is loaded the first time, it
  // should be automatically cached

  const UserAvatar({super.key});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  Future<String?> getDefaultUserAvatarUrl() async {
    try {
      return await FirebaseStorage.instance
          .ref()
          .child('/user.png')
          .getDownloadURL();
    } catch (e) {
      log("Couldn't load avatar: $e.toString()");
      return null;
    }
  }

  String? avatarUrl;
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData?>(context);
    avatarUrl = userData?.avatarUrl ?? avatarUrl;
    // constantly try to load default avatarUrl from firebase
    if (avatarUrl == null) {
      getDefaultUserAvatarUrl().then((value) {
        if (value != null) {
          try {
            if (mounted) {
              setState(() {
                avatarUrl = value;
              });
            }
          } catch (e) {
            print('Error in avatar widget: ${e.toString()}');
          }
        }
        // TODO remake this
        // reload the widget and try to get default_user_avatar from firebase
        // each 3 minutes
        else {
          Future.delayed(const Duration(minutes: 3), () => setState(() {}));
        }
      });
    }
    ImageProvider avatar = avatarUrl == null
        ? const AssetImage('images/default_user_avatar.png')
        : NetworkImage(avatarUrl!) as ImageProvider;
    if (avatarUrl != null) log(avatarUrl!);
    return CircleAvatar(
      radius: 24,
      // https://stackoverflow.com/questions/66561177/the-argument-type-object-cant-be-assigned-to-the-parameter-type-imageprovide
      backgroundImage: avatar,
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fortytwo/firebase_config/firebase_options.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/services/auth.dart';
import 'package:fortytwo/shared_widgets/loading_widget.dart';
import 'package:fortytwo/wrappers/user_object_provider_wrapper.dart';
import 'package:provider/provider.dart';

class FirebaseInitializatorWrapper extends StatefulWidget {
  final Widget child;
  const FirebaseInitializatorWrapper({super.key, required this.child});

  @override
  State<FirebaseInitializatorWrapper> createState() =>
      _FirebaseInitializatorWrapperState();
}

class _FirebaseInitializatorWrapperState
    extends State<FirebaseInitializatorWrapper> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (_, firebaseInitializationSnapshot) {
          if (firebaseInitializationSnapshot.hasError) {
            return ErrorPage(
              code: '97843',
              details: firebaseInitializationSnapshot.error.toString(),
            );
          }
          if (firebaseInitializationSnapshot.connectionState ==
              ConnectionState.waiting) {
            return const Loading();
          }
          if (firebaseInitializationSnapshot.hasData) {
            return Provider<AuthService>.value(
              value: AuthService(),
              child: UserObjectProviderWrapper(
                child: widget.child,
              ),
            );
          }
          return const ErrorPage(code: '84893');
        });
  }
}

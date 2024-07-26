import 'dart:developer';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fortytwo/models/user.dart';
import 'package:fortytwo/screens/home/grade_course.dart';
import 'package:fortytwo/screens/wrapper.dart';
import 'package:fortytwo/services/auth.dart';
import 'package:fortytwo/shared/loading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainView(),
        '/grade_courses': (context) => const GradeCourse(),
      },
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  bool loading = true;

  _MainViewState() {
    log('loading firebase');
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) => setState(() {
          loading = false;
          log('loaded firebase');
        }));
  }

  @override
  Widget build(BuildContext context) {
    // return Text('MyApp');
    return loading
        ? const Loading()
        : StreamProvider<UserObject?>.value(
            initialData: null,
            value: AuthService().user,
            child: const Wrapper(),
          );
  }
}

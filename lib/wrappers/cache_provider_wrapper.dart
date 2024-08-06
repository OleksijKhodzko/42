import 'package:flutter/material.dart';
import 'package:fortytwo/services/cache.dart';
import 'package:fortytwo/wrappers/firebase_initializator_wrapper.dart';
import 'package:provider/provider.dart';

class CacheProviderWrapper extends StatelessWidget {
  final Widget child;
  const CacheProviderWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Provider<CacheService>.value(
      value: CacheService(),
      child: FirebaseInitializatorWrapper(key: UniqueKey(), child: child),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fortytwo/wrappers/cache_provider_wrapper.dart';

class Wrapper extends StatelessWidget {
  final Widget child;
  const Wrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CacheProviderWrapper(child: child);
  }
}

import 'package:flutter/material.dart';

class VertiacalPadding extends StatelessWidget {
  final Widget child;
  const VertiacalPadding({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 30,
        ),
        Flexible(child: child),
        const SizedBox(width: 30),
      ],
    );
  }
}

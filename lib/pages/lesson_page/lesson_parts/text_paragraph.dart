import 'package:flutter/material.dart';

class LessonParagraph extends StatelessWidget {

  const LessonParagraph({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return RichText(
            text: TextSpan(
              children: <TextSpan> [
                const TextSpan(text: '  '),
                TextSpan(text: text, style: const TextStyle(fontSize: 16, color: Colors.black, height: 1.6)),
                const TextSpan(text: '\n'),
              ],
            ),
          );
  }

}
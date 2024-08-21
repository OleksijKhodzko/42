import 'package:flutter/material.dart';

class LessonParagraph extends StatelessWidget {

  const LessonParagraph({super.key, this.customText, this.text});

  final List<TextSpan>? customText;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return RichText(
            text: TextSpan(
              children: customText,
            ),
          );
  }

}
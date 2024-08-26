import 'package:flutter/material.dart';

class TextParagraph extends StatelessWidget {

  const TextParagraph({super.key, this.customText});

  final List<TextSpan>? customText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: RichText(
              text: TextSpan(
                children: customText,
              ),
            ),
    );
  }

}
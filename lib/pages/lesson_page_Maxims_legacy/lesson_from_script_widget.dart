import 'package:flutter/material.dart';

class LessonFromScriptWidget extends StatelessWidget {
  final String script;
  const LessonFromScriptWidget({super.key, required this.script});

  @override
  Widget build(BuildContext context) {
    const _script = '<Block>'
        '<Text>'
        'Це перший абзац.'
        '</Text>'
        '<Tab><Text>'
        'Це другий абзац з '
        '<BoldText>жирним</BoldText>'
        ' текстом.</Text>'
        '<Tab><Text>А це абзац з</Text>'
        '<ColoredText[Red]>червоним<ColoredText>'
        '<Text>словом</Text>'
        '<Task>'
        '</Block>';
    return const Placeholder();
  }
}

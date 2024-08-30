import 'package:flutter/material.dart';
import 'package:fortytwo/shared_widgets/vertical_pagging.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_markdown_latex/flutter_markdown_latex.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/pages/lesson_page/lesson_content.dart';
import 'package:tex_markdown/tex_markdown.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    final lesson = ModalRoute.of(context)?.settings.arguments as Lesson?;
    // TODO: uncomment this after prototyping
    // if (lesson == null) {
    //   return const ErrorPage(code: '93499');
    // }
    // TODO: comment the next line, it's for development only
    final String lessonScriptText = lessonText; // lesson.script;
    return Scaffold(
      appBar: AppBar(title: Text("Хімія") // lesson.title),
          ),
      body: VertiacalPadding(
        child: SingleChildScrollView(
          child: TexMarkdown(
            lessonScriptText,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      // body: MarkdownBody(
      //   selectable: true,
      //   data: lessonScriptText,
      //   builders: {
      //     'latex': LatexElementBuilder(),
      //   },
      //   extensionSet: md.ExtensionSet(
      //     [LatexBlockSyntax()],
      //     [LatexInlineSyntax()],
      //   ),
      // ),

      // body: Markdown(
      //   data: lessonScriptText,
      //   styleSheet: MarkdownStyleSheet(
      //     h1: TextStyle(fontSize: 24),
      //     h2: TextStyle(fontSize: 20),
      //     a: TextStyle(color: Colors.blue),
      //   ),
      // ),
    );
  }
}

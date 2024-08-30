import 'package:flutter/material.dart';
import 'package:fortytwo/pages/lesson_page/block_widget.dart';
import 'package:fortytwo/shared_widgets/vertical_pagging.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/lesson_page/lesson_content.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class LessonPage extends StatefulWidget {
  static final _key = GlobalKey();
  LessonPage() : super(key: _key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late List<bool> visibles;
  late List<String> textBlocks;
  List<String> parseLesson(String lesson) {
    // List<List<String>> textBlocks = lesson
    //     .split(
    //       RegExp(r'(?=\\section\*{.*?})'),
    //     )
    //     .map(
    //       (section) => section.split(
    //         RegExp(r'(?<=\\section\*{.*?})'),
    //       ),
    //     )
    //     .toList();
    // List<String> returnBlocks = [];
    // for (var block in textBlocks) {
    //   for (var string in block) {
    //     returnBlocks.add(string);
    //   }
    // }
    // return returnBlocks;
    var sectionRegex = RegExp(r'(?=\\section\*{.*?})');
    List<String> textBlocks = lesson.split(sectionRegex);
    return textBlocks
        .map(
          (string) => string.replaceAllMapped(
            RegExp(r'\\section\*{(.*?)}'),
            (match) => "# ${match.group(1) ?? ''}",
          ),
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    const String lessonScriptText = lessonText; // lesson.script;
    textBlocks = parseLesson(lessonScriptText);
    for (String block in textBlocks) {
      print('#################################');
      print('#################################');
      print('');
      print(block);
      print('');
      print('#################################');
      print('#################################');
    }
    visibles = textBlocks.map((_) => false).toList();
    visibles[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    final lesson = ModalRoute.of(context)?.settings.arguments as Lesson?;
    // TODO: uncomment this after prototyping
    // if (lesson == null) {
    //   return const ErrorPage(code: '93499');
    // }
    // TODO: comment the next line, it's for development only
    final ItemScrollController itemScrollController = ItemScrollController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Хімія"), // lesson.title),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: VertiacalPadding(
          child: ScrollablePositionedList.builder(
            physics: AlwaysScrollableScrollPhysics(),
            itemScrollController: itemScrollController,
            itemCount: textBlocks.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BlockWidget(
                    textBlock: textBlocks[index],
                    visibles: visibles,
                    index: index,
                    goToNextBlock: () {
                      setState(() {
                        visibles[index + 1] = true;
                      });
                      itemScrollController.scrollTo(
                        index: index + 1,
                        duration: const Duration(milliseconds: 600),
                      );
                    },
                  ),
                  if (visibles[index])
                    const SizedBox(
                      height: 600,
                      // color: Colors.red,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),

      // body: VertiacalPadding(
      //   child: SingleChildScrollView(
      //     child: TexMarkdown(
      //       lessonScriptText,
      //       style: const TextStyle(
      //         fontSize: 20,
      //       ),
      //       onLinkTab: (url, title) {
      //         print(url);
      //         print(title);
      //       },
      //     ),
      //   ),
      // ),

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

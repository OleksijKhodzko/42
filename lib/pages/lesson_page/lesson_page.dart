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
  int currentIndex = 0;
  late ItemScrollController itemScrollController;
  // this 3 lists are of the same length
  late List<bool> visibles; // each value here represents whether
  // the widget is currently shown
  late List<bool> scrollables; // each value here represents whether
  late List<bool> scrolled; // each value here represents whether

  // the next widget should be scrolled to
  // or not. It is ussualy true for large blocks
  late List<String> textBlocks;
  List<String> parseLesson(String lesson) {
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
    itemScrollController = ItemScrollController();
    const String lessonScriptText = lessonText; // lesson.script;
    textBlocks = parseLesson(lessonScriptText);
    // this isn't the best choice for performance, but it is more clear
    // this way. I just create two lists of the same size as textBlocks
    visibles = textBlocks.map((_) => false).toList();
    scrollables = textBlocks.map((_) => false).toList();
    scrolled = textBlocks.map((_) => false).toList();
    visibles[0] = true;
    int index = 1;
    for (String block in textBlocks) {
      bool scrollable = block.contains(r'#@!#');
      if (scrollable && index < scrollables.length) {
        scrollables[index] = true;
        textBlocks[index - 1] = block.replaceAll('#@!#', '');
      }
      print('#################################');
      print('#################################');
      print('');
      print(block);
      print('');
      print('#################################');
      print('#################################');
      index++;
    }
  }

  Future scroll() async {
    await Future.delayed(
      const Duration(milliseconds: 400),
    );
    itemScrollController.scrollTo(
      index: currentIndex,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (itemScrollController.isAttached &&
        scrollables[currentIndex] &&
        !scrolled[currentIndex]) {
      scroll();
      scrolled[currentIndex] = true;
    }
    final lesson = ModalRoute.of(context)?.settings.arguments as Lesson?;
    // TODO: uncomment this after prototyping
    // if (lesson == null) {
    //   return const ErrorPage(code: '93499');
    // }
    // TODO: comment the next line, it's for development only
    return Scaffold(
      appBar: AppBar(
        title: const Text("Хімія"), // lesson.title),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: VertiacalPadding(
          child: ScrollablePositionedList.builder(
            physics: const AlwaysScrollableScrollPhysics(),
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
                      currentIndex++;
                      setState(() {
                        visibles[index + 1] = true;
                      });
                      // if (0 < index && index < visibles.length - 1) {
                      //   if (scrollables[index - 1] || scrollables[index]) {
                      //
                      //   }
                      // }
                    },
                  ),
                  if (visibles[index] && !visibles[index + 1])
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
    );
  }
}

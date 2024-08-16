import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_animation.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_paragraph.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {

  Lesson? lesson;

  List<Widget> widgetsOnScreen = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    lesson ??= ModalRoute.of(context)?.settings.arguments as Lesson?;
  }
  
  Future<void> _getPartOfLesson (String text) async {
    for (int i = 0; i < text.length - 3; i++){
      if (text.substring(i, i+3)=='</p') {
        int k = i + 3;
        while(text.substring(k, k+3) != 'p/>') {
          k++;
        }
        widgetsOnScreen.add(LessonParagraph(text: text.substring(i+3, k)));
      }
      else if (text.substring(i, i+3)=='</a') {

        int k = i + 3;
        int hIndex = -1, wIndex = -1;

        while(text.substring(k, k+3) != 'a/>') {
          k++;
          if (text.substring(k, k + 2) == 'h:') {
            hIndex = k;
          } else if (text.substring(k, k + 2) == 'w:') {
            wIndex = k;
          }
        }
        widgetsOnScreen.add(LessonAnimation(ref: text.substring(i+3, hIndex), 
          height: double.parse(text.substring(hIndex + 2, wIndex)), 
          width: double.parse(text.substring(wIndex + 2, k)),));
      }
      // else if (text.substring(i, i+3)=='</b') {
      //   int k = i + 3;
      //   while(text.substring(k, k+3) != 'b/>') {
      //     k++;
      //   }
      //   widgetsOnScreen.add(LessonParagraph(text: text.substring(i+3, k)));
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      lesson ??= ModalRoute.of(context)?.settings.arguments as Lesson?;
    });
    return lesson == null
        ? const ErrorPage(code: '09828')
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFDFDA3A),
              elevation: 0.0,
              title: Text(lesson!.title, style: const TextStyle(fontSize: 20),),
            ),
            body: FutureBuilder(
              future: _getPartOfLesson(lesson!.script),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done){
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: widgetsOnScreen,
                      ),
                    ),
                  );
                }
                else if(snapshot.connectionState == ConnectionState.waiting){
                  return const CircularProgressIndicator();
                }
                else{
                  return const ErrorPage(code: '09828');
                }
              },
            ),
          );
  }
}
import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_animation.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_paragraph.dart';
import 'package:fortytwo/shared_widgets/loading_widget.dart';

class LessonPageInteractive extends StatefulWidget {
  const LessonPageInteractive({super.key});

  @override
  State<LessonPageInteractive> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPageInteractive> {

  Lesson? lesson;
  int pageIndex = 0;
  List<List<Widget>> widgetsOnScreen = [];
  List<Widget> blockWidgets = [];
  String buttonText = 'Next';

  // @override
  // void initState() {
  //   super.initState();
  //   buttonText = 'Next';
  // }

  Future<void> _getPartOfLesson (String text) async {
    for (int i = 0; i < text.length - 4; i++){
      if (text.substring(i, i+4)=='</bl') {
        List<Widget> bufferList = [];
        int k = i + 4;
        while(text.substring(k, k+4) != 'bl/>') {
          if(text.substring(k, k+3)=='</p'){
            int k1 = k + 3;
            while(text.substring(k1, k1+3) != 'p/>'){
              k1++;
            }
            bufferList.add(LessonParagraph(text: text.substring(k+3, k1)));
          }
          if(text.substring(k, k+3)=='</a'){
            int k1 = k + 3;
            while(text.substring(k1, k1+3) != 'a/>'){
              k1++;
            }
            bufferList.add(LessonAnimation(ref: text.substring(k+3, k1)));
          }
          k++;
        }
        widgetsOnScreen.add(bufferList);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    lesson ??= ModalRoute.of(context)?.settings.arguments as Lesson?;
    return lesson == null
        ? const ErrorPage(code: '09828')
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFFDFDA3A),
              elevation: 0.0,
              title: Text(lesson!.title, style: const TextStyle(fontSize: 20),),
            ),
            body: Padding(
              padding: const EdgeInsets.all(13),
                child: Align(
                  alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: pageIndex == 0 ? FutureBuilder(
                        future: _getPartOfLesson (lesson!.script), 
                        builder: (context, snapshot) {
                          for (List<Widget> i in widgetsOnScreen){
                            blockWidgets.add(Column(children: i,));
                          }
                          if (snapshot.connectionState == ConnectionState.done){
                            return Padding(
                              padding: const EdgeInsets.all(13),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: blockWidgets[pageIndex],
                              )
                            );
                          }
                          else if(snapshot.connectionState == ConnectionState.waiting){
                            return const Loading();
                          }
                          else{
                            return const ErrorPage(code: '09828');
                          }
                        },
                      ) : Padding(
                              padding: const EdgeInsets.all(13),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: blockWidgets[pageIndex],
                              )
                            ),
                    ),
                ),
            ),
          
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                height: 50,
                width: 100,           
                child: FloatingActionButton(
                  onPressed: () {
                    if (pageIndex == widgetsOnScreen.length - 1){
                      //Navigator.of(context).pushNamed('/course_content');
                    }
                    if (pageIndex == widgetsOnScreen.length - 2){
                      setState((){pageIndex++; buttonText = 'Finish lesson';});
                    }
                    else{
                      setState((){pageIndex++;});
                    }
                  },
                  backgroundColor: Colors.green,
                  child: Text(buttonText, style: const TextStyle(color: Colors.white, fontSize: 14),),
                ),
              ),
            ),
        );
  }
}
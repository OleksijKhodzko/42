import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_animation.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_paragraph.dart';

class LessonPageInteractive extends StatefulWidget {
  const LessonPageInteractive({super.key});

  @override
  State<LessonPageInteractive> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPageInteractive> {

  Lesson? lesson;
  int pageIndex = 0;
  List<Widget> widgetsOnScreen = [];
  String buttonText = 'Next';

  // @override
  // void initState() {
  //   super.initState();
  //   buttonText = 'Next';
  // }

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
    lesson ??= ModalRoute.of(context)?.settings.arguments as Lesson?;
    setState((){
      if (pageIndex == 0) {
        _getPartOfLesson (lesson!.script);
      }
    });
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
                    child: widgetsOnScreen[pageIndex],
                ),
            ),
          
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                height: 50,
                width: 100,           
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      pageIndex++;
                      //buttonText = '${widgetsOnScreen.length - 1}';
                      
                    });
                  },
                  backgroundColor: Colors.green,
                  child: Text(buttonText, style: const TextStyle(color: Colors.white, fontSize: 14),),
                ),
              ),
            ),
            // floatingActionButton: Stack(
            //   children: <Widget>[
            //     Padding(
            //       padding: const EdgeInsets.only(right: 20),
            //       child: SizedBox(
            //         height: 50,
            //         width: 100,
            //         child: _showButton ?
            //           FloatingActionButton(
            //             floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
            //             onPressed: () {
            //               setState(() {
            //                 pageIndex++;
            //                 if (pageIndex == widgetsOnScreen.length - 1) {
            //                   _showButton = false;
            //                 }
            //               });
            //             },
            //             backgroundColor: Colors.green,
            //             child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 14),),
            //           ) : null,
            //       ),
            //     ),
                
            //     Padding(
            //       padding: const EdgeInsets.only(right: 20),
            //       child: SizedBox(
            //         height: 50,
            //         width: 100,
            //         child: _showButton ?
            //           FloatingActionButton(
            //             onPressed: () {
            //               setState(() {
            //                 pageIndex++;
            //                 if (pageIndex == widgetsOnScreen.length - 1) {
            //                   _showButton = false;
            //                 }
            //               });
            //             },
            //             backgroundColor: Colors.green,
            //             child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 14),),
            //           ) : null,
            //       ),
            //     ),
            //   ],
            // ),
            //   body: FutureBuilder(
            //   future: _getPartOfLesson(lesson!.script),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done){
            //       return Padding(
            //         padding: const EdgeInsets.all(13),
            //         child: Align(
            //           alignment: Alignment.topCenter,
            //           child: widgetsOnScreen[pageIndex]
            //         )
            //       );
            //     }
            //     else if(snapshot.connectionState == ConnectionState.waiting){
            //       return const CircularProgressIndicator();
            //     }
            //     else{
            //       return const ErrorPage(code: '09828');
            //     }
            //   },
            // ),
        );
  }
}
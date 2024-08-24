import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/error_page/error_page.dart';
import 'package:fortytwo/shared_widgets/loading_widget.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/img_in_lesson_widget.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_in_lesson_widget.dart';
//import 'package:fortytwo/pages/lesson_page/lesson_parts/render_core.dart';



class LessonPageInteractive extends StatefulWidget {
  const LessonPageInteractive({super.key});

  @override
  State<LessonPageInteractive> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPageInteractive> {

  Lesson? lesson;
  List<Widget> widgetsOnScreen = [];
  final _scrollController = ScrollController();
  bool _isButtonVis = false;
  bool _isScreenGenerated = false;
  
  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      if(_scrollController.position.atEdge){
        if (_scrollController.position.pixels > 0){
          if (!_isButtonVis){
            setState(() {
              _isButtonVis = true;
            });
          }
        }
      }
      // else{
      //   if (_isButtonVis){
      //     setState(() {
      //       _isButtonVis = false;
      //     });
      //   }
      // }
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener((){});
    _scrollController.dispose(); 
    super.dispose();
  }

  List<Widget> _getLessonPage(String text) {
    List<Widget> listOfLessonElements = [];

    for (int i = 0; i < text.length - 4; i++){
      if (text.substring(i, i+4)=='</bl') {
        List<Widget> bufferList = [];
        int k = i + 4;
        while(text.substring(k, k+4) != 'bl/>') {
          if(text.substring(k, k+3)=='</p'){
            List<TextSpan> textBuffer = [];
            int k1 = k + 3;
            int p1 = 0;
            while(text.substring(k1, k1+3) != 'p/>'){
              if(text.substring(k1, k1+5)=='/bld('){
                textBuffer.add(TextSpan(text: text.substring(k+3, k1)));
                p1 = k1 + 5;
                while(text.substring(p1, p1+1)!=')'){
                  p1++;
                }
                textBuffer.add(TextSpan(text: text.substring(k1+5, p1)));
              }
              k1++;
            }
            textBuffer.add(TextSpan(text: text.substring(p1 + 1, k1)));
            bufferList.add(LessonParagraph(customText: textBuffer));
          }
          if(text.substring(k, k+3)=='</a'){
            int k1 = k + 3;
            while(text.substring(k1, k1+3) != 'a/>'){
              k1++;
            }
            bufferList.add(LessonAnimation(ref: text.substring(k+3, k1)));
          }
          if(text.substring(k, k+4)=='</ie'){
            int k1 = k + 4;
            while(text.substring(k1, k1+4) != 'ie/>'){
              k1++;
            }
            bufferList.add(LessonAnimation(ref: text.substring(k+4, k1)));
          }
          k++;
        }
        bufferList.add(FloatingActionButton(backgroundColor: Colors.green, child: Text("Hi bro"), onPressed: (){}));
        listOfLessonElements.add(Column(children: bufferList));
      }
    }
    _isScreenGenerated = true;
    return listOfLessonElements;
  }
  
  @override
  Widget build(BuildContext context) {
    lesson ??= ModalRoute.of(context)?.settings.arguments as Lesson?;
    return lesson == null
        ? const ErrorPage(code: '09828')
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 189, 189, 189),
              elevation: 0.0,
              title: Text(lesson!.title, style: const TextStyle(fontSize: 20,)),
            ),
            body: Padding(
                padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: widgetsOnScreen.length, 
                    itemBuilder: (context, index) {
                      return _getLessonPage(lesson!.script)[index];      
                    } 
                  ) 
            ), 
          );       
  }
}
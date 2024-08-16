import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';

class LessonLevelMapWidget extends StatelessWidget {
  final Lesson lesson;
  final int index;
  const LessonLevelMapWidget(this.lesson, {super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // return Text(
    //   lesson.title,
    //   style: TextStyle(color: Colors.red),
    // );
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 10,
        shadowColor: Colors.deepPurple,
        // for some reason, it aligns the text in the center
        visualDensity: VisualDensity.comfortable,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
      ),
      child: Text(index.toString()),
    );
  }
}

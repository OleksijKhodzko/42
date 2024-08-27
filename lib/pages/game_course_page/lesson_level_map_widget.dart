import 'package:flutter/material.dart';
import 'package:fortytwo/models/course_progress.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/game_course_page/level_preview_popup_widget.dart';

class LessonLevelMapWidget extends StatelessWidget {
  final Lesson lesson;
  final LessonStats stats;
  final int index;
  const LessonLevelMapWidget(
      {required this.lesson,
      super.key,
      required this.index,
      required this.stats});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  LessonPreviewPopupWidget(lesson: lesson, stats: stats),
            );
          },
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
            alignment: Alignment.center,
          ),
          child: const SizedBox(),
        ),
        Text(
          index.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}

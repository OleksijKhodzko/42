import 'package:flutter/material.dart';
import 'package:fortytwo/models/course_progress.dart';
import 'package:fortytwo/models/lesson.dart';

class LessonPreviewPopupWidget extends StatelessWidget {
  final Lesson lesson;
  final LessonStats stats;
  const LessonPreviewPopupWidget(
      {super.key, required this.lesson, required this.stats});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(lesson.title),
      content: Column(
        children: [
          Expanded(
            child: Align(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Text(
                    lesson.description ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            // child: Center(child: Text('${stats.score.toString()}%')),
            child: Stack(
              alignment: Alignment.center,
              children: (stats.score == null || stats.score == 0)
                  ? [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/lesson_page', arguments: lesson);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(24),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                        child: const Icon(
                          Icons.play_arrow_outlined,
                          size: 50,
                        ),
                      ),
                    ]
                  : [
                      Text(
                        '${stats.score.toString()}%',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator(
                          value: (stats.score ?? 0) / 12,
                          // backgroundColor: Colors.grey.shade200,
                          semanticsLabel: 'Circular progress indicator',
                          strokeWidth: 16,
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                    ],
            ),
          ),
        ],
      ),
      actions: (stats.score == null || stats.score == 0)
          ? []
          : [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/lesson_page', arguments: lesson);
                },
                child: const Icon(Icons.restart_alt),
              ),
            ],
    );
  }
}

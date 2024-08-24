import 'package:flutter/material.dart';
import 'package:fortytwo/models/course_progress.dart';
import 'package:fortytwo/models/course_section.dart';

class CoursePreviewPopupWidget extends StatelessWidget {
  final CourseSection section;
  final SectionStats stats;
  const CoursePreviewPopupWidget(
      {super.key, required this.section, required this.stats});

  @override
  Widget build(BuildContext context) {
    // return AlertDialog(
    //   title: Text(section.title),
    //   content: Column(
    //     children: [
    //       Text(section.description ?? ''),
    //       Text('${stats.totalSectionScore.toString()}%'),
    //     ],
    //   ),
    //   actions: const [],
    // );
    return AlertDialog(
      title: Text(section.title),
      content: Column(
        children: [
          Expanded(
            child: Align(
              child: Center(
                child: Text(
                  section.description ?? '',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Expanded(
            // child: Center(child: Text('${stats.score.toString()}%')),
            child: Stack(
              alignment: Alignment.center,
              children: (stats.totalSectionScore == null ||
                      stats.totalSectionScore == 0)
                  ? [
                      ElevatedButton(
                        onPressed: () {},
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
                        '${stats.totalSectionScore.toString()}%',
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator(
                          value: (stats.totalSectionScore ?? 0) / 12,
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
      actions: (stats.totalSectionScore == null || stats.totalSectionScore == 0)
          ? []
          : [
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.restart_alt),
              ),
            ],
    );
  }
}

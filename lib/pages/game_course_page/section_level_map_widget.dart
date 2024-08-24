import 'package:flutter/material.dart';
import 'package:fortytwo/models/course_progress.dart';
import 'package:fortytwo/models/course_section.dart';
import 'package:fortytwo/pages/game_course_page/course_preview_popup_view.dart';

class SectionLevelMapWidget extends StatelessWidget {
  final CourseSection section;
  final SectionStats stats;
  final int index;
  const SectionLevelMapWidget(
      {required this.section,
      super.key,
      required this.index,
      required this.stats});

  @override
  Widget build(BuildContext context) {
    // return Text(
    //   section.title,
    //   style: TextStyle(color: Colors.white),
    // );
    // return ElevatedButton(
    //   onPressed: () {
    //     showDialog(
    //       context: context,
    //       builder: (BuildContext context) =>
    //           CoursePreviewPopupWidget(section: section, stats: stats),
    //     );
    //   },
    //   style: ElevatedButton.styleFrom(
    //     elevation: 10,
    //     shadowColor: Colors.deepPurple,
    //     // for some reason, it aligns the text in the center
    //     visualDensity: VisualDensity.comfortable,
    //     shape: const CircleBorder(),
    //     padding: const EdgeInsets.all(24),
    //     backgroundColor: Colors.black,
    //     foregroundColor: Colors.white,
    //     alignment: Alignment.center,
    //   ),
    //   child: Text(
    //     index.toString(),
    //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //   ),
    // );
    // remade with stack to fit into small boxes
    return Stack(
      alignment: Alignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  CoursePreviewPopupWidget(section: section, stats: stats),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shadowColor: Colors.deepPurple,
            // for some reason, it aligns the text in the center
            visualDensity: VisualDensity.comfortable,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(24),
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            alignment: Alignment.center,
          ),
          child: const SizedBox(
            width: 15,
            height: 15,
          ),
        ),
        Text(
          index.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

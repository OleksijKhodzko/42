import 'package:flutter/material.dart';
import 'package:fortytwo/models/course_section.dart';

class SectionLevelMapWidget extends StatelessWidget {
  final CourseSection section;
  final int index;
  const SectionLevelMapWidget(this.section, {super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // return Text(
    //   section.title,
    //   style: TextStyle(color: Colors.white),
    // );
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(section.title),
              content: Row(
                children: [
                  Text(section.description ?? ''),
                ],
              ),
              actions: const [],
            );
          },
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
      ),
      child: Container(
          child: Text(index.toString(),
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
    );
  }
}

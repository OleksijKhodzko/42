import 'package:flutter/material.dart';
import 'package:fortytwo/models/course_section.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/game_course_page/lesson_level_map_widget.dart';
import 'package:fortytwo/pages/game_course_page/section_level_map_widget.dart';
import 'package:fortytwo/shared_widgets/vertical_pagging.dart';

class ChainedLevelsMap extends StatelessWidget {
  static const linesColor = Colors.black87;
  static var lines = [
    Stack(
      children: [
        Align(
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(
                  height: 15,
                ),
              ),
              Expanded(
                child: Container(
                  height: 15,
                  color: linesColor,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Align(
                child: Container(
                  width: 15,
                ),
              ),
            ),
            Expanded(
              child: Align(
                child: Container(
                  width: 15,
                  color: linesColor,
                ),
              ),
            ),
          ],
        ),
        Align(
          child: Container(
            width: 15,
            height: 15,
            color: linesColor,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Container(
            height: 15,
            color: linesColor,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 15,
                  color: linesColor,
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 15,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Align(
                child: Container(
                  width: 15,
                ),
              ),
            ),
            Expanded(
              child: Align(
                child: Container(
                  width: 15,
                  color: linesColor,
                ),
              ),
            ),
          ],
        ),
        Align(
          child: Container(
            width: 15,
            height: 15,
            color: linesColor,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Container(
            width: 15,
            color: linesColor,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Container(),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Container(
            width: 15,
            color: linesColor,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Row(
            children: [
              const Expanded(
                child: SizedBox(
                  height: 15,
                ),
              ),
              Expanded(
                child: Container(
                  height: 15,
                  color: linesColor,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Align(
                child: Container(
                  width: 15,
                  color: linesColor,
                ),
              ),
            ),
            Expanded(
              child: Align(
                child: Container(
                  width: 15,
                ),
              ),
            ),
          ],
        ),
        Align(
          child: Container(
            width: 15,
            height: 15,
            color: linesColor,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Container(
            height: 15,
            color: linesColor,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 15,
                  color: linesColor,
                ),
              ),
              const Expanded(
                child: SizedBox(
                  height: 15,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Expanded(
              child: Align(
                child: Container(
                  width: 15,
                  color: linesColor,
                ),
              ),
            ),
            Expanded(
              child: Align(
                child: Container(
                  width: 15,
                ),
              ),
            ),
          ],
        ),
        Align(
          child: Container(
            width: 15,
            height: 15,
            color: linesColor,
          ),
        ),
      ],
    ),
  ];

  static final rowTypes = [
    // Type A
    (List<int> row) => Row(
          children: [
            Expanded(
              flex: 32,
              child: Stack(
                children: [
                  lines[row[1]],
                ],
              ),
            ),
            Expanded(
              flex: 32,
              child: Stack(
                children: [
                  lines[row[2]],
                ],
              ),
            ),
            Expanded(
              flex: 32,
              child: Stack(
                children: [
                  lines[row[3]],
                ],
              ),
            ),
          ],
        ),
    // Type B
    (List<int> row) => Row(
          children: [
            Expanded(
              flex: 32,
              child: Stack(
                children: [
                  lines[row[1]],
                ],
              ),
            ),
            Expanded(
              flex: 16,
              child: Stack(
                children: [
                  lines[row[2]],
                ],
              ),
            ),
            Expanded(
              flex: 32,
              child: Stack(
                children: [
                  lines[row[3]],
                ],
              ),
            ),
            Expanded(
              flex: 16,
              child: Stack(
                children: [
                  lines[row[4]],
                ],
              ),
            ),
          ],
        ),
    // Type C
    (List<int> row) => Row(
          children: [
            Expanded(
              flex: 16,
              child: Stack(
                children: [
                  lines[row[1]],
                ],
              ),
            ),
            Expanded(
              flex: 32,
              child: Stack(
                children: [
                  lines[row[2]],
                ],
              ),
            ),
            Expanded(
              flex: 16,
              child: Stack(
                children: [
                  lines[row[3]],
                ],
              ),
            ),
            Expanded(
              flex: 32,
              child: Stack(
                children: [
                  lines[row[4]],
                ],
              ),
            ),
          ],
        ),
  ];
  final List<CourseSection> content;
  const ChainedLevelsMap({super.key, required this.content});

  // TODO: impletemt generateGrid, generateGridWidget and populatedGridWidget

  List<List<int>> generateGrid() {
    return [
      [0, 1, 1, 2],
      [0, 4, 4, 5],
      [2, 4, 0, 1, 8],
      [2, 4, 6, 2, 4],
      [2, 4, 4, 5, 4],
      [2, 4, 4, 5, 4],
    ];
  }

  List<List<int>> generateLevelPoints() {
    return [
      [0, 2]
    ];
  }

  Column generateChainWidget(List<List<int>> grid) {
    // return const Placeholder();
    return Column(
      children: grid.map((row) {
        return SizedBox(height: 70, child: rowTypes[row[0]](row));
      }).toList(),
    );
  }

  List<Widget> generateContentWidgetsList() {
    List<Widget> contentWidgets = [];
    int k = 1;
    for (CourseSection section in content) {
      contentWidgets.add(SectionLevelMapWidget(section, index: k));
      if (section.lessons == null) {
        print('Empty section');
        continue;
      }
      int n = 1;
      for (Lesson lesson in section.lessons!) {
        contentWidgets.add(LessonLevelMapWidget(lesson, index: n));
        n++;
      }
      k++;
    }
    return contentWidgets;
  }

  // Геніальна хрінь, бажано не чіпати до скону віків,
  // це мистецтво, пацани, ви не розумієте; дівчата, мій телефон:
  //                                098 325 41 37
  void populateChainWidget(chainWidget) {
    List<List<int>> levelPoints = generateLevelPoints();
    List<Widget> contentWidgets = generateContentWidgetsList();
    for (int i = 0; i < levelPoints.length; i++) {
      int k = 0;
      for (int j in levelPoints[i]) {
        if (i * 3 + k < contentWidgets.length) {
          chainWidget.children[i].child.children[j].child.children.add(
            SizedBox(
              child: Center(
                child: contentWidgets[i * 3 + k],
              ),
            ),
          );
        }
        k++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    /*
       This diagram explains the logic 
       behind the digits in the table
      • ––––– • ––––– • ––––– •
      | 0     |   1   |     2 |
      |   +---------------+   |
      |   |   |       |   |   |
      • ––|–– • ––––– • ––|–– •
      |   |   |       |   |   |
      | 3 |   |   4   |   | 5 |
      |   |   |       |   |   |
      • ––|–– • ––––– • ––|–– •
      |   |   |       |   |   |
      |   +---------------+   |
      |   6   |   7   |     8 |
      • ––––– • ––––– • ––––– •

      The first didgit in each
      row indicates its type:
                      ------------
      - Type A (0) - |   |   |   |
                     -------------
                     -------------
      - Type B (1) - |   | |   | |
                     -------------
                     -------------
      - Type C (1) - | |   | |   |
                     -------------

      Yeah, I khow it doesn't clear anything out, but it's too
      long to explain and it is probaly easier to rewrite it from
      scratch if you see this in the future and I am not in the project
      no more. If I am - ask me!

       */

    final grid = generateGrid();
    final chainWidget = generateChainWidget(grid);
    populateChainWidget(chainWidget);
    return VertiacalPadding(
      child: chainWidget,
    );
  }
}

class Tile extends StatelessWidget {
  final Widget child;
  const Tile({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.cyan,
      child: child,
    );
  }
}

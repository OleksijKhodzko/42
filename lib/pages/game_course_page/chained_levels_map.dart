import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortytwo/models/course.dart';
import 'package:fortytwo/models/course_progress.dart';
import 'package:fortytwo/models/course_section.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:fortytwo/pages/game_course_page/course_finish_widget.dart';
import 'package:fortytwo/pages/game_course_page/lesson_level_map_widget.dart';
import 'package:fortytwo/pages/game_course_page/section_level_map_widget.dart';
import 'package:fortytwo/shared_widgets/vertical_pagging.dart';

class ChainedLevelsMap extends StatefulWidget {
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
  // final List<CourseSection> content;
  final Course course;
  const ChainedLevelsMap({super.key, required this.course});

  @override
  State<ChainedLevelsMap> createState() => _ChainedLevelsMapState();
}

class _ChainedLevelsMapState extends State<ChainedLevelsMap> {
  List<List<int>> levelPoints = [];

  // Generate the grid used to render the map and modify levelPoints
  List<List<int>> generateGrid() {
    /*
                            The first didgit in each
                            row indicates its type:
                                            -----------
                            - Type A (0) - |   |   |   |
                                           -------------
                                           -------------
                            - Type B (1) - |   | |   | |
                                           -------------
                                           -------------
                            - Type C (2) - | |   | |   |
                                           -------------
      List<List<int>> grid = [
        [0, 2, 2, 3], - Type A
      ];
      int currentType = 0; - can be from 0 to 2
      int currentPosition = 1; - can be from 1 to 4
      void addNode() {
        Adds current position (using [currentPosition] and 
        [grid.length]) to [levelPoints].
      }
      void changePosition() {
        Changes currentPosition to the opposite side of the horizontal line
        and triggers [continue] if possible. If The horizontal is already
        filled or it is a vertical stroke, doesn't do anything.
      }
      void addLayer() {
        Adds to [grid] and [levelPoints] a new layer, which
        depends on the [currentType] and currentPosition[]: 
        A1 -> A, B;   A2 -> A; A3 -> A, C;
        B1 -> A, B;   B2 -> B; B3 -> B,     B4 -> B;
        C1 -> C;      C2 -> C; C3 -> C,     C4 -> A, C;
      }
                 widgetList = generateContentWidgetsList()
                           /
      for (Widget W in widgetList) {
        addNode();
        changePosition();
        addLayer();
      }
      return grid;
    */
    // TODO: make something not to generate this twice
    //  (the second is in [populateChainWidget])
    List<Widget> widgetList = generateContentWidgetsList();
    List<List<int>> grid = [
      [0, 4, 3, 4],
    ];
    int currentType = 0;
    int currentPosition = 2;
    void addNode() {
      // levelPoints[grid.length - 1][currentPosition - 1]
      if (levelPoints.length != grid.length) {
        levelPoints.add([]);
      }
      levelPoints.last.add(currentPosition - 1);
    }

    // Put a path from p.A to p.B
    void go(List<int> endOpts) {
      int end = (endOpts..shuffle()).first;
      if (currentPosition >= grid.last.length ||
          end >= grid.last.length ||
          currentPosition < 1 ||
          end < 1) {
        print('Invalid currentPosition or end'
            '(go function in chained_levels_map)');
        return;
      }
      if (currentPosition < end) {
        grid.last[currentPosition] = 6;
        for (int i = currentPosition + 1; i < end; i++) {
          grid.last[i] = 1;
        }
        grid.last[end] = 2;
        currentPosition = end;
      } else if (currentPosition > end) {
        grid.last[currentPosition] = 8;
        for (int i = currentPosition - 1; i > end; i--) {
          grid.last[i] = 1;
        }
        grid.last[end] = 0;
        currentPosition = end;
      } else {
        print('Cant move, currentPosition = end'
            '(go function in chained_levels_map)');
      }
    }

    bool changePosition() {
      if (grid.last.sublist(1).contains(3) ||
          grid.last.sublist(1).contains(5)) {
        // it means there is a vertical stroke, therefore
        // the path can only go down
        return false;
      }
      if (grid.last.sublist(1).contains(0) ||
          grid.last.sublist(1).contains(2)) {
        // it means there is a corner facing down, therefore
        // the path can only go down
        return false;
      }
      switch (currentType) {
        // Type A
        case 0:
          switch (currentPosition) {
            case 1:
              go([2, 3]);
            case 2:
              go([1, 3]);
            case 3:
              go([1, 2]);
            default:
              print(
                  'incorrect currentPosition: $currentPosition, $currentType, changePosition');
          }
        // Types B and C
        case 1 || 2:
          switch (currentPosition) {
            case 1:
              go([2, 3, 4]);
            case 2:
              go([1, 3, 4]);
            case 3:
              go([1, 2, 4]);
            case 4:
              go([1, 2, 3]);
            default:
              print(
                  'incorrect currentPosition: $currentPosition, $currentType, changePosition');
          }
      }

      print('///////////////////////'
          'Switched to $currentPosition position'
          '///////////////////////');
      return true;
    }

    void addLayer({bool verticalStroke = false}) {
      switch (currentType) {
        // Type A
        case 0:
          switch (currentPosition) {
            case 1:
              currentType = Random().nextInt(2);
            case 2:
              break;
            case 3:
              currentType = Random().nextInt(2) * 2;
              if (currentType == 2) currentPosition = 4;
            default:
              print(
                  'incorrect currentPosition: $currentPosition, $currentType');
          }
        // Type B
        case 1:
          switch (currentPosition) {
            case 1:
              currentType = 0;
            case 2 || 3 || 4:
              break;
            default:
              print(
                  'incorrect currentPosition: $currentPosition, $currentType');
          }
        // Type C
        case 2:
          switch (currentPosition) {
            case 1 || 2 || 3:
              break;
            case 4:
              currentPosition = 3;
              currentType = 0;
            default:
              print(
                  'incorrect currentPosition: $currentPosition, $currentType');
          }
        default:
          print('incorrect currentType');
      }
      List<int> row;
      switch (currentType) {
        case 0:
          row = [0, 4, 4, 4];
        case 1:
          row = [1, 4, 4, 4, 4];
        case 2:
          row = [2, 4, 4, 4, 4];
        default:
          print('Wrong currentType');
          return;
      }
      print(verticalStroke.toString());
      if (verticalStroke) row[currentPosition] = 3;
      grid.add(row);
      print('///////////////////////'
          'Added $currentType level'
          '///////////////////////');
      print(grid.last.toString());
    }

    bool verticalStroke = false;
    int widgetNum = widgetList.length;
    for (int i = 0; i < widgetNum; i++) {
      addNode();
      if (changePosition()) {
        verticalStroke = Random().nextInt(3) == 0;
        continue;
      }
      // this is to add finish widget in the end
      if (i == widgetNum - 2) verticalStroke = true;
      if (i == widgetNum - 1) break;
      addLayer(verticalStroke: verticalStroke);
      verticalStroke = false;
    }

    for (List i in grid) print(i.toString());
    return grid;
  }

  List<Widget> generateChainWidget(List<List<int>> grid) {
    return grid.map((row) {
      return SizedBox(
          height: 70, child: ChainedLevelsMap.rowTypes[row[0]](row));
    }).toList();
  }

  // It is used in [populateChainWidget].
  List<Widget> generateContentWidgetsList() {
    if (widget.course.data.content == null) {
      print('no data in the content');
      return [];
    }
    List<Widget> contentWidgets = [];
    int k = 1;
    for (CourseSection section in widget.course.data.content!) {
      contentWidgets.add(
        SectionLevelMapWidget(
            section: section,
            stats: widget.course.progress.sections?[k - 1] ??
                SectionStats(totalSectionScore: 0),
            index: k),
      );
      if (section.lessons == null) {
        print('Empty section');
        continue;
      }
      int n = 1;
      for (Lesson lesson in section.lessons!) {
        contentWidgets.add(LessonLevelMapWidget(
            lesson: lesson,
            stats: widget.course.progress.sections?[k - 1]?.lessons[n - 1] ??
                LessonStats(
                  score: 0,
                ),
            index: n));
        n++;
      }
      k++;
    }
    contentWidgets.add(SizedBox());
    contentWidgets.add(CourseFinishLevelMapWidget());
    print('Length of contentWidgets: ${contentWidgets.length.toString()}');
    return contentWidgets;
  }

  // Геніальна хрінь, бажано не чіпати до скону віків
  void populateChainWidget(chainWidget) {
    List<Widget> contentWidgets = generateContentWidgetsList();
    int k = 0;
    for (int i = 0; i < levelPoints.length; i++) {
      for (int j in levelPoints[i]) {
        print(i);
        if (k < contentWidgets.length) {
          // It is adding to the Stack widget
          chainWidget[i].child.children[j].child.children.add(
                SizedBox(
                  child: Center(
                    child: contentWidgets[k],
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
      - Type C (2) - | |   | |   |
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
      child: ListView(
        children: chainWidget,
      ),
    );
  }
}

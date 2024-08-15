import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fortytwo/models/course_section.dart';

class ChainedLevelsMap extends StatelessWidget {
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
                  color: Colors.black,
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
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Align(
          child: Container(
            width: 15,
            height: 15,
            color: Colors.black,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Container(
            height: 15,
            color: Colors.black,
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
                  color: Colors.black,
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
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Align(
          child: Container(
            width: 15,
            height: 15,
            color: Colors.black,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Container(
            width: 15,
            color: Colors.black,
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
            color: Colors.black,
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
                  color: Colors.black,
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
                  color: Colors.black,
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
            color: Colors.black,
          ),
        ),
      ],
    ),
    Stack(
      children: [
        Align(
          child: Container(
            height: 15,
            color: Colors.black,
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
                  color: Colors.black,
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
                  color: Colors.black,
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
            color: Colors.black,
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

  Widget generateChainWidget(List<List<int>> grid) {
    // return const Placeholder();
    return Column(
      children: grid.map((row) {
        return SizedBox(height: 70, child: rowTypes[row[0]](row));
      }).toList(),
    );
  }

  Widget populatedChainWidget(Widget gridWidget) {
    return const Placeholder();
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
    // this grid is used later to visually chain level and section widgets
    // List<List<int>> grid = [
    //   [0, 1, 1, 2],
    //   [0, 4, 4, 5],
    //   [2, 4, 0, 1, 8],
    //   [2, 4, 6, 2, 4],
    //   [2, 4, 4, 5, 4],
    //   [2, 4, 4, 5, 4],
    // ];

    final grid = generateGrid();
    final gridWidget = generateChainWidget(grid);
    return gridWidget;
    // return Column(
    //   children: [
    //     Row(
    //       children: [
    //         Tile(child: lines[0]),
    //         Tile(child: lines[1]),
    //         Tile(child: lines[2]),
    //       ],
    //     ),
    //     Row(
    //       children: [
    //         Tile(child: lines[3]),
    //         Tile(child: lines[4]),
    //         Tile(child: lines[5]),
    //       ],
    //     ),
    //     Row(
    //       children: [
    //         Tile(child: lines[6]),
    //         Tile(child: lines[7]),
    //         Tile(child: lines[8]),
    //       ],
    //     ),
    //   ],
    // );

    // return populatedGridWidget(gridWidget);
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

import 'package:flutter/material.dart';
import 'package:fortytwo/screens/home/grade_tile.dart';

class GradesGrid extends StatefulWidget {
  const GradesGrid({super.key});

  @override
  State<GradesGrid> createState() => _GradesGridState();
}

class _GradesGridState extends State<GradesGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: [
        Container(
          color: Colors.blueGrey,
          child: InkWell(
            child: const GradeTile(text: '5 клас'),
            onTap: () {
              Navigator.pushNamed(context, '/grade_courses', arguments: 5);
            },
          ),
        ),
        Container(
          color: Colors.amber,
          child: const GradeTile(text: '6 клас'),
        ),
        Container(
          color: Colors.pink,
          child: const GradeTile(text: '7 клас'),
        ),
        Container(
          color: Colors.blue,
          child: const GradeTile(text: '8 клас'),
        ),
        Container(
          color: Colors.red,
          child: const GradeTile(text: '9 клас'),
        ),
        Container(
          color: Colors.green,
          child: const GradeTile(text: '10 клас'),
        ),
        Container(
          color: Colors.cyan,
          child: const GradeTile(text: '11 клас'),
        ),
      ],
    );
  }
}

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
          // child: const GradeTile(text: '5 клас'),
          child: InkWell(
            child: const GradeTile(text: '5 клас'),
            onTap: () {
              Navigator.pushNamed(context, '/grade_courses',
                  arguments: 'f41ev5xU57CTLRLvpj1q');
            },
          ),
        ),
        Container(
          color: Colors.amber,
          child: InkWell(
            child: const GradeTile(text: '6 клас'),
            onTap: () {
              Navigator.pushNamed(context, '/grade_courses', arguments: 6);
            },
          ),
        ),
        Container(
          color: Colors.pink,
          child: InkWell(
            child: const GradeTile(text: '7 клас'),
            onTap: () {
              Navigator.pushNamed(context, '/grade_courses', arguments: 7);
            },
          ),
        ),
        Container(
          color: Colors.blue,
          child: InkWell(
            child: const GradeTile(text: '8 клас'),
            onTap: () {
              Navigator.pushNamed(context, '/grade_courses', arguments: 8);
            },
          ),
        ),
        Container(
          color: Colors.red,
          child: InkWell(
            child: const GradeTile(text: '9 клас'),
            onTap: () {
              Navigator.pushNamed(context, '/grade_courses', arguments: 9);
            },
          ),
        ),
        Container(
          color: Colors.green,
          child: InkWell(
            child: const GradeTile(text: '10 клас'),
            onTap: () {
              Navigator.pushNamed(context, '/grade_courses', arguments: 10);
            },
          ),
        ),
        Container(
          color: Colors.cyan,
          child: InkWell(
            child: const GradeTile(text: '11 клас'),
            onTap: () {
              Navigator.pushNamed(context, '/grade_courses', arguments: 11);
            },
          ),
        ),
        Container(
          color: Colors.teal,
          child: InkWell(
            child: const GradeTile(text: '12 клас'),
            onTap: () {
              Navigator.pushNamed(context, '/grade_courses', arguments: 12);
            },
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fortytwo/screens/home/grades_grid.dart';
import 'package:fortytwo/screens/home/home.dart';

class Grades extends StatelessWidget {
  const Grades({super.key});

  @override
  Widget build(BuildContext context) {
    return const Home(child: GradesGrid());
  }
}

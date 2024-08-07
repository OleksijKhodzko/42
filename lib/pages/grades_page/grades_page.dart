import 'package:flutter/material.dart';
import 'package:fortytwo/pages/grades_page/grade_tile.dart';
import 'package:fortytwo/shared_widgets/avatar_widget.dart';

class GradesPage extends StatefulWidget {
  const GradesPage({super.key});

  @override
  State<GradesPage> createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              InkWell(
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onTap: () {},
                  child: const UserAvatar()),
              Expanded(
                flex: 60,
                child: Container(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/saved_courses');
                  },
                  child: const SizedBox(
                      width: 48, height: 48, child: Icon(Icons.save, size: 40)),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: GridView.count(
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
                    Navigator.pushNamed(context, '/grade_courses',
                        arguments: 6);
                  },
                ),
              ),
              Container(
                color: Colors.pink,
                child: InkWell(
                  child: const GradeTile(text: '7 клас'),
                  onTap: () {
                    Navigator.pushNamed(context, '/grade_courses',
                        arguments: 7);
                  },
                ),
              ),
              Container(
                color: Colors.blue,
                child: InkWell(
                  child: const GradeTile(text: '8 клас'),
                  onTap: () {
                    Navigator.pushNamed(context, '/grade_courses',
                        arguments: 8);
                  },
                ),
              ),
              Container(
                color: Colors.red,
                child: InkWell(
                  child: const GradeTile(text: '9 клас'),
                  onTap: () {
                    Navigator.pushNamed(context, '/grade_courses',
                        arguments: 9);
                  },
                ),
              ),
              Container(
                color: Colors.green,
                child: InkWell(
                  child: const GradeTile(text: '10 клас'),
                  onTap: () {
                    Navigator.pushNamed(context, '/grade_courses',
                        arguments: 10);
                  },
                ),
              ),
              Container(
                color: Colors.cyan,
                child: InkWell(
                  child: const GradeTile(text: '11 клас'),
                  onTap: () {
                    Navigator.pushNamed(context, '/grade_courses',
                        arguments: 11);
                  },
                ),
              ),
              Container(
                color: Colors.teal,
                child: InkWell(
                  child: const GradeTile(text: '12 клас'),
                  onTap: () {
                    Navigator.pushNamed(context, '/grade_courses',
                        arguments: 12);
                  },
                ),
              ),
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:fortytwo/models/lesson.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LessonTile extends StatefulWidget {
  final Lesson lesson;
  const LessonTile({super.key, required this.lesson});

  @override
  State<LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile> {

  bool _isInteractive = false;

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  Future<void> _loadState() async {
    _isInteractive = (await getBoolFromCache('interactive_lesson')) ?? false;
    setState(() {});
  }

  Future<bool?> getBoolFromCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  @override
  Widget build(BuildContext context) => ListTile(
        title: Text(widget.lesson.title),
        subtitle: Text(widget.lesson.description ?? 'Поки немає опису'),
        onTap: () {
          if (_isInteractive) {
            Navigator.of(context).pushNamed('/lesson_page_interactive', arguments: widget.lesson);
          }
          else{
            Navigator.of(context).pushNamed('/lesson_page', arguments: widget.lesson);
          }
        },
      );
}

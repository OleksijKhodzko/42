import 'package:flutter/material.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/lesson_content.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/img_in_lesson_widget.dart';
import 'package:fortytwo/pages/lesson_page/lesson_parts/text_in_lesson_widget.dart';
import 'dart:convert';

String widgetToJson(Widget widget) {
  Map<String, dynamic> widgetMap = _widgetToMap(widget);
  return jsonEncode(widgetMap);
}

Map<String, dynamic> _widgetToMap(Widget widget) {

  if (widget is SingleChildScrollView) {
    return {
      'type': 'SingleChildScrollView',
      'child': _widgetToMap(widget.child!),
    };
  }
  else if (widget is TextParagraph) {
    return {
      'type': 'TextParagraph',
      'customText': widget.customText!.map((span) => _textSpanToMap(span)).toList(),
    };
  } else if (widget is LessonIllustration) {
    return {
      'type': 'LessonIllustration',
      'ref': widget.ref,
    };
  } else if (widget is Column) {
    return {
      'type': 'Column',
      'children': widget.children.map((child) => _widgetToMap(child)).toList(),
    };
  } else if (widget is Row) {
    return {
      'type': 'Row',
      'children': widget.children.map((child) => _widgetToMap(child)).toList(),
    };
  } else if (widget is Flexible) {
    return {
      'type': 'Flexible',
      'child': _widgetToMap(widget.child),
    };
  }
  return {
    'type': widget.runtimeType.toString(),
  };
}

Map<String, dynamic> _textSpanToMap(TextSpan textSpan) {
  return {
    'text': textSpan.text,
    'style': textSpan.style ?? _textStyleToMap(textSpan.style!),
  };
}

Map<String, dynamic> _textStyleToMap(TextStyle style) {
  return {
    'fontWeight': style.fontWeight ?? style.fontWeight.toString(),
    'color': style.color?.value.toRadixString(16),
  };
}
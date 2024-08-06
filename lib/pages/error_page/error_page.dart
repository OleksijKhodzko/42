import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String code;
  final String? details;
  const ErrorPage({super.key, required this.code, this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: Container(),
            ),
            const Expanded(
              flex: 20,
              child: Text(
                'Щось пішло не так:<',
                style: TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
              flex: 20,
              child: Text('Код помилки: $code'),
            ),
            Expanded(
              flex: 20,
              child: Text('Більше: $details'),
            ),
            Expanded(
              flex: 20,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

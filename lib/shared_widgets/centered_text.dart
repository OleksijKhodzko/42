import 'package:flutter/material.dart';

class CenteredTextPageBody extends StatelessWidget {
  final String text;
  const CenteredTextPageBody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            flex: 20,
            child: Container(),
          ),
          Expanded(
            flex: 20,
            child: Text(
              text,
              style: const TextStyle(fontSize: 25),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

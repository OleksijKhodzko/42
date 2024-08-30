import 'package:flutter/material.dart';
import 'package:fortytwo/packages/tex_markdown/tex_markdown.dart';

class BlockWidget extends StatefulWidget {
  final String textBlock;
  final List<bool> visibles;
  final int index;
  final Function goToNextBlock;
  const BlockWidget(
      {super.key,
      required this.textBlock,
      required this.visibles,
      required this.index,
      required this.goToNextBlock});

  @override
  State<BlockWidget> createState() => _BlockWidgetState();
}

class _BlockWidgetState extends State<BlockWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.visibles[widget.index]) {
      return Column(
        children: [
          TexMarkdown(
            widget.textBlock,
            style: const TextStyle(
              fontSize: 20,
            ),
            onLinkTab: (url, title) {
              print(url);
              print(title);
            },
          ),
          ElevatedButton(
            onPressed: () {
              widget.goToNextBlock();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              shadowColor: Colors.grey,
              elevation: 5,
            ),
            child: const Text('Далі'),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

import 'dart:html';

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

class _BlockWidgetState extends State<BlockWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.visibles[widget.index]) {
      return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
          builder: (BuildContext context, double opacity, Widget? child) {
            return Opacity(
              opacity: opacity,
              child: Column(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            );
          });
    } else {
      return const Visibility(
        visible: false,
        child: SizedBox.shrink(),
      );
    }
  }
}

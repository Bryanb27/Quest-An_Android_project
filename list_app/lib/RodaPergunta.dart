import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class RodaPergunta extends StatelessWidget {
  StreamController<int> selected = StreamController<int>();

 /* @override
  void dispose() {
    selected.close();
    //super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Português',
      'Matemática',
      'Ciências',
      'História',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Fortune Wheel'),
      ),
      body: GestureDetector(
        onTap: () {
          // setState(() {
          selected.add(
            Fortune.randomInt(0, items.length),
          );
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var it in items) FortuneItem(child: Text(it)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
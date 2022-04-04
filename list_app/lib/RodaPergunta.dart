import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:io';

class RodaPergunta extends StatefulWidget{
  @override
  _RodaPergunta createState() => _RodaPergunta();
}

class _RodaPergunta extends State<RodaPergunta> {
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
    String _tipoPergunta;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Fortune Wheel'),
      ),
      body: Container(
        color: Colors.amber,
        child: GestureDetector(
          onTap: () {
            setState(() {
            selected.add(
              Fortune.randomInt(0, items.length),
            );
            _tipoPergunta = selected.toString();
            });
            //sleep(Duration(seconds:1));

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
      ),

    );

  }
}
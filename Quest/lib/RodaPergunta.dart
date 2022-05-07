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
  final items = <String>[
    'Português',
    'Matemática',
    'Ciências',
    'História',
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        selected.add(
          Fortune.randomInt(0, items.length),
        );
        Navigator.pushNamed(
          context,
          "/Pergunta",
        );
        // Here you can write your code for open new view
      });
    });
    //super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _tipoPergunta;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Fortune Wheel'),
      ),
      body: Container(
        color: Colors.amber,

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
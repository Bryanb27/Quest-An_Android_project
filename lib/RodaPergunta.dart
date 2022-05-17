import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'dart:io';

import 'package:list_app/Pergunta.dart';

class RodaPergunta extends StatefulWidget{
  @override
  _RodaPergunta createState() => _RodaPergunta();
}

class _RodaPergunta extends State<RodaPergunta> {
  StreamController<int> selected = StreamController<int>();
  final items = <String>[
    'Literatura',
    'Historia',
    'Ciências',
    'Geografia',
  ];
  int tmp = null;
  @override
  void initState() {
    super.initState();
   // Future.delayed(const Duration(milliseconds: 8000), () {
      setState(() async{
        final time = await Future.delayed(Duration(seconds: 10)).then((value) => DateTime.now());
        selected.add(
            tmp = Fortune.randomInt(0, items.length),
        );
        // Here you can write your code for open new view
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Pergunta(tipo_Pergunta: this.tmp)
          ),
        );
      });
    //});
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
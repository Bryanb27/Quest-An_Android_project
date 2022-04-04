import 'package:flutter/material.dart';
import 'Home.dart';
import 'RodaPergunta.dart';
import 'Pergunta.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/Roda_da_pergunta": (context) => RodaPergunta(),
      "/Pergunta": (context) => Pergunta(),
    },
    home: Home(),
  ));
}
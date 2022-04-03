import 'package:flutter/material.dart';
import 'Home.dart';
import 'RodaPergunta.dart';
void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/Roda_da_pergunta": (context) => RodaPergunta(),
    },
    home: Home(),
  ));
}
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        children: [
      Container(
      width: double.infinity,
      height: 130.0,
      margin: EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          'Questões',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
    ),
      ),
      ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: null,
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Text(
                'Respostas',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: null,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Text(
                'Respostas',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: null,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Text(
                'Respostas',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(15.0),
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: null,
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Text(
                'Respostas',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
          )
          ],
      ),
    ),
    );
  }
}

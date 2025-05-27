import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(RandomEx1());

class RandomEx1 extends StatefulWidget {
  const RandomEx1({super.key});
  @override
  State<RandomEx1> createState() => _RandomEx1State();
}

class _RandomEx1State extends State<RandomEx1> {
  Random ran = Random();
  // ran.nextDouble(); // 0.0 ~ 1
  List<Widget> list = [];

  Offset generatePosition(double width, double height){
    double x = ran.nextDouble() * (width - 50);
    double y = ran.nextDouble() * (height - 50);
    return Offset(x, y);
  }

  @override
  Widget build(BuildContext context) {
    double width  = MediaQuery.of(context).size.width;
    double height  = MediaQuery.of(context).size.height;

    for(int i=0; i<10; i++){
      Offset position = generatePosition(width, height);
      list.add(
          Positioned(
            left: position.dx,
            top: position.dy,
            child: Container(
              height: 50, width: 50, color: Colors.blue[100],
              child: Center(child: Text((i+1).toString()),),
            )
          )
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: list,
        )
      ),
    );
  }
}

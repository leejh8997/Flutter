import 'package:flutter/material.dart';

void main() {
  runApp(const StackEx1());
}

class StackEx1 extends StatelessWidget {
  const StackEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.blue,),
              // Container(width: 150, height: 150, color: Colors.green, margin: EdgeInsets.all(20),),
              Container(width: 150, height: 150, color: Colors.green,),
              Container(width: 100, height: 100, color: Colors.orange,),
            ],
          ),
        ),
      ),
    );
  }
}
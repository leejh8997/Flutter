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
  // int nextNumber = 1;
  int idx = 0;
  Offset generatePosition(double width, double height){
    double x = ran.nextDouble() * (width - 50);
    double y = ran.nextDouble() * (height - 50);
    return Offset(x, y);
  }
  
  void removeItem(int index){
    if(index == idx){
      idx++;
      setState(() {
        list.removeAt(0);
      });
      if(list.length == 0){
        idx = 0;
        createList();
      }
    }
  }
  void createList(){
    double width  = MediaQuery.of(context).size.width;
    double height  = MediaQuery.of(context).size.height;
    List<Widget> tempList = [];
    for(int i=0; i<10; i++){
      // int number = i + 1;
      Offset position = generatePosition(width, height);
      tempList.add(
          Positioned(
              left: position.dx,
              top: position.dy,
              child: GestureDetector(
                onTap: ()=>removeItem(i),
                child: Container(
                  height: 50, width: 50, color: Colors.blue[100],
                  child: Center(child: Text((i+1).toString()),),
                ),
              )
          )
      );
    }
    setState(() {
      list = tempList;
    });
  }
  @override
  void initState(){
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((timestamp){
      createList();
    });

  }
//   for(int i=0; i<10; i++){
//   int number = i + 1;
//   Offset position = generatePosition(width, height);
//   tempList.add(
//   Positioned(
//   left: position.dx,
//   top: position.dy,
//   child: GestureDetector(
//   onTap: () {
//   if (number == nextNumber) {
//   setState(() {
//   list.removeWhere((widget) {
//   return (widget as Positioned).child is GestureDetector &&
//   ((widget.child as GestureDetector).child as Container)
//       .child is Center &&
//   ((((widget.child as GestureDetector).child as Container)
//       .child as Center)
//       .child as Text)
//       .data == number.toString();
//   });
//   nextNumber++; // 다음 숫자 증가
//   });
//   }
//   },
//   child: Container(
//   height: 50,
//   width: 50,
//   color: Colors.blue[100],
//   child: Center(child: Text(number.toString())),
//   ),
//   ),
//   ),
//   );
//   }
//   setState(() {
//   list = tempList;
//   });
// });
// }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: list,
        )
      ),
    );
  }
}

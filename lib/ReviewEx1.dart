import 'package:flutter/material.dart';

void main() {
  runApp(const ReviewEx1());
}

class ReviewEx1 extends StatelessWidget {
  const ReviewEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[100],
          title: Text("타이틀", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        drawer: Drawer(),
        body: Row(
            children: [
              Expanded(child: Container(color: Colors.blue)),// 다른 요소가 쓰는 공간 외에 나머지 공간 차지
              Container(width: 150, color: Colors.green),
            ]
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){
                print("뒤로가기 클릭!");
              }, icon:Icon(Icons.backspace)),
              IconButton(onPressed: (){
                print("gha 클릭!");
              }, icon:Icon(Icons.home_filled)),
              IconButton(onPressed: (){
                print("카메라 클릭!");
              }, icon:Icon(Icons.camera_alt))
            ],
          ),
        ),
      ),
    );
  }
}
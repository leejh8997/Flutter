import 'package:flutter/material.dart';

void main() {
  runApp(GridViewEx2());
}

class GridViewEx2 extends StatelessWidget {
  GridViewEx2({super.key});
  List<String> path = ["te.jpeg","img1.jpg","img2.jpg","img3.jpg","img4.jpg","img5.jpg","img6.jpg",];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
          // 고정 크기의 배열을 정렬
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
          ),
          itemCount: path.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
                child: Image.asset(path[index], fit: BoxFit.fill)
            );
          },
        ),
      ),
    );
  }
}
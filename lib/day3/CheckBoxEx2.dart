import 'package:flutter/material.dart';

void main() => runApp(CheckBoxEx2());

class CheckBoxEx2 extends StatefulWidget {
  const CheckBoxEx2({super.key});

  @override
  State<CheckBoxEx2> createState() => _CheckBoxEx2State();
}

class _CheckBoxEx2State extends State<CheckBoxEx2> {
  List<String> checkedList = [];
  List<String> imgList = [
    "te.jpeg",
    "img1.jpg",
    "img2.jpg",
  ];
  void listChanged(String path, bool isChecked){
    setState(() {
      if(isChecked){
        checkedList.add(path);
      }else{
        checkedList.remove(path);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            ListTile(
              title: Text("자바"),
              leading: Checkbox(
                  value: checkedList.contains(imgList[0]),
                  onChanged: (value) => listChanged(imgList[0], value!),
              ),
            ),
            ListTile(
              title: Text("오라클"),
              leading: Checkbox(
                value: checkedList.contains(imgList[1]),
                onChanged: (value) => listChanged(imgList[1], value!),
              ),
            ),
            ListTile(
              title: Text("HTML"),
              leading: Checkbox(
                value: checkedList.contains(imgList[2]),
                onChanged: (value) => listChanged(imgList[2], value!),
              ),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 2열
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: checkedList.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    checkedList[index],
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover, // 이미지가 200x200 안에 꽉 차게
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

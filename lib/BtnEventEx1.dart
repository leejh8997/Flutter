import 'package:flutter/material.dart';

void main() {
  runApp(const BtnEventEx1());
}

class BtnEventEx1 extends StatefulWidget {
  const BtnEventEx1({super.key});

  @override
  State<BtnEventEx1> createState() => _BtnEventEx1State();
}

class _BtnEventEx1State extends State<BtnEventEx1> {
  var color_green = Colors.green[100];
  var color_blue = Colors.blue[100];
  var align_top =  Alignment.topCenter;
  var align_center =  Alignment.center;
  var text_1 = Text("Flutter");
  var text_2 = Text("플러터");
  bool btnClick = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Align(
          alignment: btnClick ? align_top : align_center,
          child: ElevatedButton(
            onPressed: (){
                setState(() { // 값 바꾸고 화면 재렌더링
                  btnClick = !btnClick;
                  print(btnClick);
                });
            },
            child: btnClick ? text_1 : text_2,
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(btnClick ? color_blue : color_green)),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp( DropdownEx1());
}
class DropdownEx1 extends StatefulWidget {
  const DropdownEx1({super.key});

  @override
  State<DropdownEx1> createState() => _DropdownEx1State();
}

class _DropdownEx1State extends State<DropdownEx1> {
  String? selectedItem = "java";
  List<String> list = ["java","oracle","html","flutter"];
  Map<String, String> map = {"java":"te.jpeg","oracle":"img1.jpg","html":"img2.jpg","flutter":"img3.jpg"};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                  value: selectedItem,
                  icon: Icon(Icons.arrow_downward),
                  style: TextStyle(color: Colors.blue),
                  items: list.map((String item){
                    return DropdownMenuItem(
                        value: item,
                        child: Text(item)
                    );
                  }).toList(),
                  onChanged: (String? value){ // ? 없이 선언하면 널이 들어갈 수 없음
                    setState((){
                      selectedItem = value;
                      // selectedItem = value!; // 절대 널이 들어갈 수 없다고 검증해서 널이 안들어갈거라고 명시
                    });
                  }
              ),
              Container(
                  height: 300,
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child:
               Image.asset(
                      map[selectedItem!]!
                      // selectedItem == "java" ? "te.jpeg" : selectedItem == "oracle" ? "img1.jpg" : selectedItem == "html" ? "img2.jpg" : "img3.jpg",
                      )
              )
            ],
          ),
        ),
      ),
    );
  }
}
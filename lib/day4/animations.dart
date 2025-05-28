import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : AniEx1()
    );
  }
}


class AniEx1 extends StatefulWidget {
  @override
  State<AniEx1> createState() => _AniEx1State();
}

class _AniEx1State extends State<AniEx1> {
  double _width = 250, _height = 250;
  Color _color = Colors.lightBlue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child : GestureDetector(
                    onTap: (){
                      setState(() {
                        _width = _width == 250 ? 400 : 250;
                        _height = _height == 250 ? 400 : 250;
                        _color = _color == Colors.lightBlue ?Colors.orange : Colors.lightBlue;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 3),
                      width: _width,
                      height: _height,
                      color : _color,
                      curve: Curves.easeOut,
                      child: Center(
                          child: Text("클릭", style: TextStyle(fontSize: 20, color : Colors.white),)
                      ),
                    )
                )
            ),

          ],
        )
    );
  }
}
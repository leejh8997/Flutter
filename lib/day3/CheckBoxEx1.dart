import 'package:flutter/material.dart';

void main() => runApp(CheckBoxEx1());

class CheckBoxEx1 extends StatefulWidget {
  const CheckBoxEx1({super.key});

  @override
  State<CheckBoxEx1> createState() => _CheckBoxEx1State();
}

class _CheckBoxEx1State extends State<CheckBoxEx1> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Checkbox(
                  value: isChecked1,
                  onChanged: (value) {
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                ),
                Text("자바"),
                Checkbox(
                  value: isChecked2,
                  onChanged: (value) {
                    setState(() {
                      isChecked2 = value!;
                    });
                  },
                ),
                Text("오라클"),
              ],
            ),
          ],
        ),
      )
    );
  }
}

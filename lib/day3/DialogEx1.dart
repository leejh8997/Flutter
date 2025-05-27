import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DialogHomePage(),
    );
  }
}

class DialogHomePage extends StatelessWidget {
  const DialogHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("다이얼로그")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) {
              return  AlertDialog(
                title: Text("Hello"),
                content: Text("ㅂ2"),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("삭제")
                  )
                ],
              );
            },
          ),
          child: const Text("클릭!"),
        ),
      ),
    );
  }
}
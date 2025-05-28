import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

void main() => runApp(shared());

class shared extends StatefulWidget {
  const shared({super.key});

  @override
  State<shared> createState() => _sharedState();
}

class _sharedState extends State<shared> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SharedExam(),
    );
  }
}

class SharedExam extends StatefulWidget {
  const SharedExam({super.key});

  @override
  State<SharedExam> createState() => _SharedExamState();
}

class _SharedExamState extends State<SharedExam> {
  String? name = "로그인 해주세요.";
  TextEditingController nameCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("preference"),),
      body: Column(
        children: [
          TextField(
            controller: nameCtrl,
          ),
          SizedBox(height: 20,),
          Text("현재 사용자 : $name"),
          ElevatedButton(onPressed: () async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("name", nameCtrl.text);
            nameCtrl.clear();
          }, child: Text("저장")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            setState(() {
              name = prefs.getString("name");
            });
          }, child: Text("불러오기")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async{
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.remove("name");
            setState((){
              name = "로그인 해주세요";
            });
          }, child: Text("삭제")),
        ],
      ),
    );
  }
}

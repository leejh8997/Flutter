import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(JoinApp());
}

class JoinApp extends StatelessWidget {
  const JoinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JoinEx(),
    );
  }
}

class JoinEx extends StatefulWidget {
  const JoinEx({super.key});

  @override
  State<JoinEx> createState() => _JoinExState();
}

class _JoinExState extends State<JoinEx> {
  TextEditingController idCtrl = TextEditingController();
  TextEditingController pwd1Ctrl = TextEditingController();
  TextEditingController pwd2Ctrl = TextEditingController();
  TextEditingController addrCtrl = TextEditingController();
  bool flg = false;
  final List<String> hobbyList = ["게임", "독서", "영화 감상", "음악 감상", "운동"];
  List<String> selectList = [];
  FirebaseFirestore fs = FirebaseFirestore.instance;
  
  
  void idCheck() async {
    var checkd = await fs.collection("userList").where("userId", isEqualTo: idCtrl.text).get();
    
    if(checkd.docs.isNotEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("중복되었습니다.")));
    } else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("사용가능.")));
      setState(() {
        flg = true;
      });
    }

  }
  
  void join() async {
    if(pwd1Ctrl.text != pwd2Ctrl.text){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("패스워드 확인")));
    }
    await fs.collection("userList").add({
      "userId": idCtrl.text,
      "pwd": pwd1Ctrl.text,
      "addr": addrCtrl.text,
      "hobbyList": selectList
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("회원가입 성공")));
    idCtrl.clear();
    pwd1Ctrl.clear();
    pwd2Ctrl.clear();
    addrCtrl.clear();
    setState(() {
      selectList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("회원가입"),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: idCtrl,
                    enabled: !flg,
                    decoration: InputDecoration(hintText: "아이디"),
                  ),
                ),
                ElevatedButton(
                    onPressed: idCheck,
                    child: Text("중복확인")
                )
              ],
            ),
            TextField(
              controller: pwd1Ctrl,
              obscureText: true,
              decoration: InputDecoration(hintText: "비밀번호"),
            ),
            TextField(
              controller: pwd2Ctrl,
              obscureText: true,
              decoration: InputDecoration(hintText: "재확인"),
            ),
            TextField(
              controller: addrCtrl,
              decoration: InputDecoration(hintText: "주소"),
            ),
            SizedBox(height: 20,),
            Text("취미 선택", style: TextStyle(fontWeight: FontWeight.bold),),
            ...hobbyList.map((hobby){
              return CheckboxListTile(
                title: Text(hobby),
                value: selectList.contains(hobby),
                onChanged: (value) {
                  setState(() {
                    if(value!){
                      selectList.add(hobby);
                    } else{
                      selectList.remove(hobby);
                    }
                  });
                },
              );
            }).toList(),
            ElevatedButton(
                onPressed: flg ? join : null,
                child: Text("회원가입")
            )
          ],
      ),
      ),
    );
  }
}

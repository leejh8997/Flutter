import 'package:flutter/material.dart';
import 'package:test2/day5/UserList.dart';
import 'db.dart';

void main() => runApp(UserInsert());
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // 반드시 필요
//   await DB.deleteDBFile(); // ✅ DB 파일 삭제 (1회만 실행하고 주석 처리 가능)
//   runApp(const UserInsert());
// }

class UserInsert extends StatelessWidget {
  const UserInsert({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserInsertEx(),
    );
  }
}

class UserInsertEx extends StatefulWidget {
  const UserInsertEx({super.key});

  @override
  State<UserInsertEx> createState() => _UserInsertExState();
}

class _UserInsertExState extends State<UserInsertEx> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sqflite 실습"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserList(),));
              },
              icon: Icon(Icons.list)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: "이름"
              ),
            ),
            TextField(
              controller: ageCtrl,
              decoration: InputDecoration(
                  labelText: "나이"
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async{
                  String name = nameCtrl.text;
                  int age = int.tryParse(ageCtrl.text) ?? 0;
                  await DB.insertUser(name, age);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("저장 되었음!"))
                  );
                  nameCtrl.clear();
                  ageCtrl.clear();
                },
                child: Text("사용자 추가")
            )
          ],
        ),
      ),
    );
  }
}

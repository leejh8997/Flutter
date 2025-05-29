import 'package:flutter/material.dart';

import 'db.dart';

class UserEdit extends StatefulWidget {
  int userId;
  UserEdit({super.key, required this.userId});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  Future<void> _loadUser() async{
    var user = await DB.loadUser(widget.userId);
    var userInfo = user.first;
    setState(() {
      nameCtrl.text = userInfo["name"];
      ageCtrl.text = userInfo["age"].toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("사용자 수정"),
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

                  await DB.updateUser(widget.userId,name, age);
                  Navigator.pop(context, true);

                  nameCtrl.clear();
                  ageCtrl.clear();
                },
                child: Text("수정")
            )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

import 'UserEdit.dart';
import 'db.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Map<String, dynamic>> list = [];
  Future<void> _selectUser() async{
    print("🟡 _selectUser 호출됨");
    var userList = await DB.selectUser();
    print("조회된 사용자 목록: $userList");
    setState(() {
      list = userList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("사용자목록"),),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          var user = list[index];
          return ListTile(
            title: Text("아이디 : ${user["id"]}, 이름 : ${user["name"]}"),
            subtitle: Text("나이 : ${user["age"]}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () async {
                      bool flg = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => UserEdit(userId: user["id"]),));
                      if(flg){
                        _selectUser();
                      }
                    },
                    icon: Icon(Icons.edit)
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("삭제"),
                              content: Text("${user["name"]}님을 정말 삭제 하시겠습니까?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      DB.removeUser(user["id"]);
                                      Navigator.of(context).pop();
                                      _selectUser();
                                    },
                                    child: Text("삭제")
                                ),
                                TextButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("취소")
                                )
                              ],
                            );
                          },
                      );
                    },
                    icon: Icon(Icons.delete)
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}


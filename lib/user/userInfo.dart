import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test2/user/memoPage.dart';

class UserInfo extends StatelessWidget {
  final String docId;
  const UserInfo({super.key, required this.docId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("회원 상세정보"),),
        body: FutureBuilder( // 구독안하고 데이터 뿌려줌
            future: FirebaseFirestore.instance.collection("userList").doc(docId).get(),
            builder: (context, snapshot) {
              if(!snapshot.hasData){
                return Center(child: Text("데이터 찾을 수 없음"));
              }
              final user = snapshot.data!.data() as Map<String, dynamic>;
              final hobbyList = List<String>.from(user["hobbyList"]);

              return Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("아이디 : ${user['userId']}"),
                    SizedBox(height: 10,),
                    Text("주소 : ${user['addr']}"),
                    SizedBox(height: 10,),
                    Wrap(
                      spacing: 8,
                      children: hobbyList.map((hobbyList){
                        return Chip(
                          label: Text(hobbyList),
                          backgroundColor: Colors.blue[100],
                        );
                      }).toList()
                    ),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MemoPage(docId : docId))
                          );
                        },
                        child: Text("메모 작성")
                    )
                  ]
                ),
              );
            },
        ),
    );
  }
}

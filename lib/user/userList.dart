import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test2/user/userInfo.dart';

import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(UserListApp());
}

class UserListApp extends StatelessWidget {
  const UserListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final FirebaseFirestore fs = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("사용자 목록"),),
        body: Expanded(
              child: StreamBuilder(
                  stream: fs.collection("userList").orderBy("userId").snapshots(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    final docs = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final doc = docs[index];
                        return ListTile(
                          title: Text(doc["userId"]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: (){
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => UserInfo(docId : doc.id),)
                                    );
                                  },
                                  icon: Icon(Icons.edit)
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }

              ),
            )

    );
  }
}

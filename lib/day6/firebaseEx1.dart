import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';

void main() async {
  // Flutter 프레임워크와의 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Firebase 초기화 설정
  );
  runApp(FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirebaseExam(),
    );
  }
}

class FirebaseExam extends StatefulWidget {
  const FirebaseExam({super.key});

  @override
  State<FirebaseExam> createState() => _FirebaseExamState();
}

class _FirebaseExamState extends State<FirebaseExam> {
  TextEditingController txtCtrl = TextEditingController();
  final FirebaseFirestore fs = FirebaseFirestore.instance;

  void addItem() async {
    await fs.collection("Items").add({
      "text": txtCtrl.text,
      "qwer": "zzz"
    });
  }

  void removeItem(String id) async {
    await fs.collection("items").doc(id).delete();
  }

  void editItem(String id, String currentText) async {
    TextEditingController editTextCtrl = TextEditingController(text: currentText);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("수정"),
            content: TextField(
              controller: editTextCtrl,
              decoration: InputDecoration(
                labelText: "이름"
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () async {
                    await fs.collection("items").doc(id).update({
                      "text": editTextCtrl.text
                    });
                  },
                  child: Text("저장")
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
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("파이어스토어 실습1"),),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),

              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: txtCtrl,
                        decoration: InputDecoration(hintText: "힌트"),
                      )
                  ),
                  SizedBox(width: 10,),
                  ElevatedButton(
                      onPressed: addItem,
                      child: Text("추가")
                  ),
                ],
              ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: fs.collection("items").orderBy("text").snapshots(),
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
                        title: Text(doc["text"]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () => editItem(doc.id, doc["text"]),
                                icon: Icon(Icons.edit)
                            ),
                            IconButton(
                                onPressed: () => removeItem(doc.id),
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
        ],
      ),
    );
  }
}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test2/day6/MemoEdit.dart';
import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(home: MemoList()));
}

class MemoList extends StatefulWidget {
  const MemoList({super.key});

  @override
  State<MemoList> createState() => _MemoListState();
}

class _MemoListState extends State<MemoList> {
  final FirebaseFirestore fs = FirebaseFirestore.instance;

  Future<void> _refresh() async => setState(() {});

  void _navigateToEdit({DocumentSnapshot? doc}) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MemoEdit(document: doc),
      ),
    );
    if (result == true) _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("메모장 목록")),
      body: StreamBuilder<QuerySnapshot>(
        stream: fs.collection("memos").orderBy("text").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: Text("작성된 메모가 없습니다"));
          final docs = snapshot.data!.docs;
          if (docs.isEmpty) return Center(child: Text("작성된 메모가 없습니다"));

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              return ListTile(
                title: Text("작성자: ${doc["author"]}"),
                subtitle: Text("내용: ${doc["text"]}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _navigateToEdit(doc: doc),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await fs.collection("memos").doc(doc.id).delete();
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToEdit(),
        child: Icon(Icons.add),
      ),
    );
  }
}
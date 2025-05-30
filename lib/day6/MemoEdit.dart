import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../firebase_options.dart';

class MemoEdit extends StatefulWidget {
  final DocumentSnapshot? document;

  const MemoEdit({super.key, this.document});

  @override
  State<MemoEdit> createState() => _MemoEditState();
}

class _MemoEditState extends State<MemoEdit> {
  final fs = FirebaseFirestore.instance;
  final TextEditingController authorCtrl = TextEditingController();
  final TextEditingController textCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.document != null) {
      authorCtrl.text = widget.document!["author"];
      textCtrl.text = widget.document!["text"];
    }
  }

  void _saveMemo() async {
    if (widget.document == null) {
      await fs.collection("memos").add({
        "author": authorCtrl.text,
        "text": textCtrl.text,
      });
    } else {
      await fs.collection("memos").doc(widget.document!.id).update({
        "author": authorCtrl.text,
        "text": textCtrl.text,
      });
    }
    Navigator.pop(context, true); // 목록 리로드용
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("메모 작성")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: authorCtrl, decoration: InputDecoration(labelText: "작성자")),
            TextField(controller: textCtrl, decoration: InputDecoration(labelText: "내용")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveMemo, child: Text("저장")),
          ],
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:test2/user/userList.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idCtrl = TextEditingController();
  TextEditingController pwdCtrl = TextEditingController();

  Future<void> login() async {
    final inputId = idCtrl.text.trim();
    final inputPwd = pwdCtrl.text;

    try {
      // userList에서 userId와 일치하는 문서 조회
      final snapshot = await FirebaseFirestore.instance
          .collection("userList")
          .where("userId", isEqualTo: inputId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final userData = snapshot.docs.first.data();
        if (userData['pwd'] == inputPwd) {
          // 로그인 성공 → userList 페이지로 이동 (예: UserListPage)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => UserListApp()), // 임의의 페이지
          );
          return;
        }
      }

      // 비밀번호 틀림 or userId 없음
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("아이디/비밀번호 확인해주세요")),
      );
    } catch (e) {
      print("로그인 오류: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("로그인 중 오류 발생")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("로그인")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: idCtrl,
              decoration: InputDecoration(labelText: "아이디"),
            ),
            TextField(
              controller: pwdCtrl,
              obscureText: true,
              decoration: InputDecoration(labelText: "비밀번호"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text("로그인"),
            ),
            Divider(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle, color: Colors.blue),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("소셜 로그인 준비 중")),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.login, color: Colors.green),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// // 아래는 임시 페이지 (로그인 성공 시 이동할 곳)
// class UserListPage extends StatelessWidget {
//   const UserListPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("유저 리스트")),
//       body: Center(child: Text("로그인 성공!")),
//     );
//   }
// }
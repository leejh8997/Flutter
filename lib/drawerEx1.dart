import 'package:flutter/material.dart';

void main() {
  runApp(const drawerEx1());
}

class drawerEx1 extends StatelessWidget {
  const drawerEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView( // 위에서 아래로 목록화
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("te.jpeg"),
                      ),
                      SizedBox(height: 8), // 🔥 간격 추가
                      Text(
                        "teetes",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(height: 4), // 🔥 간격 추가
                      Text(
                        "teetes@sdgagsadg",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  )
              ),
              ListTile(
                leading: Image.asset("te.jpeg"),
                title: Text("홈"),
              ),
              ListTile(
                leading: Image.asset("te.jpeg"),
                title: Text("카메라"),
              ),
              ListTile(
                leading: Image.asset("te.jpeg"),
                title: Text("로그아웃"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
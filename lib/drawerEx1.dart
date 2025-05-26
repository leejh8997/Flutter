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
          child: ListView(
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
                leading: Icon(Icons.home),
                title: Text("홈"),
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("카메라"),
              ),
              ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text("로그아웃"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
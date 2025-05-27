import 'package:flutter/material.dart';

void main() {
  runApp(const ScaffoldEx1());
}

class ScaffoldEx1 extends StatelessWidget {
  const ScaffoldEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.menu),
          title: Text("앱 제목"),
        ),
        drawer: Drawer(),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.add_box),
              title: Text("첫번째 제품"),
              subtitle: Text("1.설명~~~~~~~~~"),
            ),
            ListTile(leading: Icon(Icons.accessible_outlined),),
            ListTile(leading: Icon(Icons.add_task),),
          ],
        ),
        // Column(
        //   children: [
        //     Text("바디"),
        //     TextButton(onPressed: (){}, child: Text("Text 버튼")),
        //     IconButton(onPressed: (){}, icon: Icon(Icons.abc)),
        //     ElevatedButton(onPressed: (){}, child: Text("Elevated 버튼")),
        //     CircleAvatar(
        //       radius: 40,
        //       backgroundImage: AssetImage("te.jpeg"),
        //     )
        //   ],
        // ),
        bottomNavigationBar: BottomAppBar(
          color : Colors.grey[300],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: (){}, icon: Icon(Icons.home)
              ),
              IconButton(
                  onPressed: (){}, icon: Icon(Icons.camera_alt)
              ),
              IconButton(
                  onPressed: (){}, icon: Icon(Icons.menu)
              )
            ],
          ),

        ),
      )
    );
  }
}

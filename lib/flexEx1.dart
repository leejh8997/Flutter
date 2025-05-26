import 'package:flutter/material.dart';

void main() {
  runApp(const flexEx1());
}

class flexEx1 extends StatelessWidget {
  const flexEx1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("제목"),
          ),
          drawer: Drawer(),
          body: Row(
            children: [
              Flexible(child: Container(color: Colors.purple), flex: 1,),
              Flexible(child:Column(
                children: [
                  Flexible(child: Container(color: Colors.yellow), flex: 1,),
                  Flexible(child: Container(color:  Colors.orange), flex: 2,),
                  Flexible(child: Container(color:  Colors.cyan), flex: 2,)
                ],
              ), flex: 1,),
              Flexible(child: Container(color: Colors.black), flex: 1,),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            color : Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.add_chart_sharp),
                Icon(Icons.access_alarm_rounded),
              ]
            )
          ),
        )
    );
  }
}

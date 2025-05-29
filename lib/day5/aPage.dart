import 'package:flutter/material.dart';
import 'package:test2/day5/bPage.dart';

void main() => runApp(APage());

class APage extends StatefulWidget {
  const APage({super.key});

  @override
  State<APage> createState() => _APageState();
}

class _APageState extends State<APage> {
  String _result ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("A 페이지"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BPage(),
                      )
                  );
                },
                child: Text("B 페이지로 그냥 이동")
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BPage(message: "A에서 넘긴 값",),
                      )
                  );
                },
                child: Text("값 넘기기")
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async{
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BPage(),
                      )
                  );
                  setState(() {
                    _result = result ?? "안넘겨줌";
                  });
                },
                child: Text("되돌려 받는 버튼")
            ),
            Text("$_result << 되돌려 받은 값")
          ],
        ),
      ),
    );
  }
}

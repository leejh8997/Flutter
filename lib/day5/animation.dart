import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

void main() => runApp(AnimationApp());

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AniExam(),
    );
  }
}

class AniExam extends StatelessWidget {
  const AniExam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("오픈 컨테이너"),),
      body: Center(
        child: OpenContainer(
            transitionType: ContainerTransitionType.fade,
            transitionDuration: Duration(milliseconds: 500),
            closedBuilder: (context, action) {
              return ElevatedButton(
                  onPressed: action, 
                  child: Text("전체보기")
              );
            }, 
            openBuilder:(context, action) {
              return DetailView();
            }, 
        ),
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("전체보기"),),
      body: Center(child: Text("전체보기 페이지!"),),
    );
  }
}

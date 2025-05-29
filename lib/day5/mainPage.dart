import 'package:flutter/material.dart';
import 'package:test2/day5/aPage.dart';

void main() => runApp(MainPage());

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: APage(),
    );
  }
}

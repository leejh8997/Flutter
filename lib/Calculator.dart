import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '계산기',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('계산기'),
          backgroundColor: Colors.pink[50],
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        backgroundColor: Colors.pink[50],
        body: const CalculatorUI(),
      ),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  final List<String> buttons = const [
    'C', '(', '%', '/',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '00', '.', '='
  ];

  String input = ''; // 👉 나중에 입력값 저장할 변수

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔹 상단 입력 표시 영역
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          alignment: Alignment.centerRight,
          child: Text(
            input, // 현재 입력된 값
            style: const TextStyle(fontSize: 32),
          ),
        ),
        const Divider(height: 1),
        // 🔹 버튼 영역
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                final isOperator = ['/', '*', '-', '+', '='].contains(buttons[index]);
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      input += buttons[index]; // 👉 버튼 클릭 시 입력 문자열에 추가 (기능 테스트용)
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    backgroundColor: isOperator ? Colors.blue : Colors.grey[200],
                    foregroundColor: isOperator ? Colors.white : Colors.black,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: Text(
                    buttons[index],
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
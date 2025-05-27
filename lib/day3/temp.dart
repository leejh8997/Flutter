import 'package:flutter/material.dart';

void main() => runApp(const TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoHomePage(),
    );
  }
}

class TodoItem {
  String text;
  bool isChecked;
  TodoItem({required this.text, this.isChecked = false});
}

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({super.key});

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  final TextEditingController _controller = TextEditingController();
  List<TodoItem> todos = [];

  void _addTodo() {
    String input = _controller.text.trim();
    if (input.isNotEmpty) {
      setState(() {
        todos.add(TodoItem(text: input));
        _controller.clear();
      });
    }
  }

  void _deleteTodo(int index) {
    if (todos[index].isChecked) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text("삭제 확인"),
            content: const Text("정말 삭제하시겠습니까?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("취소"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    todos.removeAt(index);
                  });
                  Navigator.of(ctx).pop();
                },
                child: const Text("삭제"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("할 일 목록")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "할 일을 입력하세요.",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text("추가"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: todos.isEmpty
                  ? const Center(
                child: Text(
                  "할 일이 없습니다",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return ListTile(
                    leading: Checkbox(
                      value: todo.isChecked,
                      onChanged: (val) {
                        setState(() {
                          todo.isChecked = val ?? false;
                        });
                      },
                    ),
                    title: Text(todo.text),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _deleteTodo(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
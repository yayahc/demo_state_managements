import 'package:demo_inherited/list_view.dart';
import 'package:demo_inherited/provider/todo_inherited.dart';
import 'package:flutter/material.dart';
import 'todo.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onEditingComplete: _createTodo,
            controller: _controller,
          ),
          const Expanded(child: ListViewWidget())
        ],
      ),
    );
  }

  void _createTodo() {
    final todoProvider = TodoInherited.of(context).data;
    final newTodo = Todo(todoProvider.todos.length + 1, _controller.text);
    todoProvider.createTodo(newTodo);
    _controller.clear();
  }
}

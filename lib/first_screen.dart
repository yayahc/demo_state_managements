import 'package:demo_inherited/provider/todo_inherited.dart';
import 'package:flutter/material.dart';

import 'second_screen.dart';
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
    final todos = TodoInherited.of(context).data.todos;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            onEditingComplete: _createTodo,
            controller: _controller,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SecondScreen())),
                      title: Text(todos[index].name),
                    );
                  }))
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

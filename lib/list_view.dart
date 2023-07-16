import 'package:demo_inherited/second_screen.dart';
import 'package:flutter/material.dart';

import 'provider/todo_inherited.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = TodoInherited.of(context).data;
    return StreamBuilder<bool>(
        stream: todos.streamData,
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: todos.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondScreen())),
                  title: Text(todos.todos[index].name),
                  leading: IconButton(
                      onPressed: () =>
                          _deleteTodo(context, todos.todos[index].id),
                      icon: const Icon(Icons.delete)),
                );
              });
        });
  }

  void _deleteTodo(BuildContext context, int id) {
    final todoProvider = TodoInherited.of(context).data;
    todoProvider.removeTodo(id);
  }
}

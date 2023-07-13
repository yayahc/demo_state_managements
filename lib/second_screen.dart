import 'package:demo_inherited/provider/todo_inherited.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = TodoInherited.of(context).data.todos;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
        ),
        body: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todos[index].name),
                trailing: IconButton(
                  onPressed: () {
                    _deleteTodo(context, todos[index].id);
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            }));
  }

  void _deleteTodo(BuildContext context, int id) {
    final todoProvider = TodoInherited.of(context).data;
    todoProvider.removeTodo(id);
  }
}

import 'package:demo_state_managements/provider/todo_provider.dart';
import 'package:flutter/material.dart';

class TodoInherited extends InheritedWidget {
  const TodoInherited({super.key, required super.child, required this.data});

  final TodoProvider data;

  static TodoInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoInherited>()!;
  }

  @override
  bool updateShouldNotify(TodoInherited oldWidget) {
    return true;
  }
}

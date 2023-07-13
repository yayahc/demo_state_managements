import 'package:demo_inherited/provider/todo_inherited.dart';
import 'package:demo_inherited/provider/todo_provider.dart';
import 'package:flutter/material.dart';

import 'first_screen.dart';

void main() {
  runApp(TodoInherited(
      data: TodoProvider([]),
      child: const MaterialApp(
        home: FirstScreen(),
      )));
}

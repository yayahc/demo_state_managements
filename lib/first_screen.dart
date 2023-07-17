import 'package:demo_state_managements/cubit/todo_cubit.dart';
import 'package:demo_state_managements/list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    final todosCubit = BlocProvider.of<CubitProvider>(context);
    todosCubit.addTodo(Todo(todosCubit.state.length + 1, _controller.text));
    _controller.clear();
  }
}

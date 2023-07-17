import 'package:demo_state_managements/cubit/todo_cubit.dart';
import 'package:demo_state_managements/second_screen.dart';
import 'package:demo_state_managements/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitProvider, List<Todo>>(builder: (context, state) {
      return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SecondScreen())),
              title: Text(state[index].name),
              leading: IconButton(
                  onPressed: () => _deleteTodo(context, state[index].id),
                  icon: const Icon(Icons.delete)),
            );
          });
    });
  }

  void _deleteTodo(BuildContext context, int id) {
    final todosCubit = BlocProvider.of<CubitProvider>(context);
    todosCubit.removeTodo(id);
  }
}

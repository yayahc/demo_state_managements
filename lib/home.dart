import 'package:demo_state_managements/cubit_provider/cubit_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _controller;
  var content = "";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todosCubit = BlocProvider.of<CubitProvder>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo of Cubit"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: _controller,
              onChanged: (String value) => setState(() {
                content = value;
              }),
            ),
            ElevatedButton(
                onPressed: () => createTodo(todosCubit),
                child: const Text("Create")),
            Expanded(
              child: BlocBuilder<CubitProvder, List<Todo>>(builder: (_, state) {
                return ListView.builder(
                    itemCount: todosCubit.state.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(state[index].content),
                      );
                    });
              }),
            )
          ],
        ));
  }

  void createTodo(CubitProvder todosCubit) {
    todosCubit.createTodo(
        Todo(id: todosCubit.state.length + 1, content: _controller.text));
    _controller.clear();
  }
}

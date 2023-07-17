import 'package:demo_state_managements/cubit/todo_cubit.dart';
import 'package:demo_state_managements/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CubitProvider([]),
    child: const MaterialApp(
      home: FirstScreen(),
    ),
  ));
}

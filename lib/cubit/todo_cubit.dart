import 'package:flutter_bloc/flutter_bloc.dart';

import '../todo.dart';

class CubitProvider extends Cubit<List<Todo>> {
  CubitProvider(super.initialState);

  void addTodo(Todo todo) {
    final finalTodo = [...state, todo];
    emit(finalTodo);
  }

  void removeTodo(int id) {
    final finalTodo = state.where((element) => element.id != id).toList();
    emit(finalTodo);
  }
}

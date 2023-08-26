import 'package:flutter_bloc/flutter_bloc.dart';
import '../todo.dart';

class CubitProvder extends Cubit<List<Todo>> {
  CubitProvder(super.initialState);

  void createTodo(String content) {
    final todos = state.add(Todo(state.length + 1, content));
    emit(todos);
  }

  void deleteTodo() {}
}

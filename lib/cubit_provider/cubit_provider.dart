import 'package:flutter_bloc/flutter_bloc.dart';
import '../todo.dart';

class CubitProvder extends Cubit<List<Todo>> {
  CubitProvder(super.initialState);

  void createTodo(Todo todo) {
    final todos = state.add(todo) as List<Todo>;
    emit(todos);
  }

  void deleteTodo(int id) {
    final newTodos =
        state.removeWhere((element) => element.id == id) as List<Todo>;
    emit(newTodos);
  }
}

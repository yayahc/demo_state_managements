import 'dart:async';

import '../todo.dart';

class TodoProvider {
  final List<Todo> todos;
  final StreamController<bool> _streamController;
  TodoProvider(this.todos) : _streamController = StreamController.broadcast();

  Stream<bool> get streamData => _streamController.stream;

  void createTodo(Todo todo) {
    todos.add(todo);
    _streamController.add(true);
  }

  void removeTodo(int id) {
    todos.removeWhere((element) => element.id == id);
    _streamController.add(true);
  }
}

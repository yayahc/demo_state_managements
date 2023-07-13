import '../todo.dart';

class TodoProvider {
  final List<Todo> todos;
  TodoProvider(this.todos);

  void createTodo(Todo todo) {
    todos.add(todo);
  }

  void removeTodo(int id) {
    todos.removeWhere((element) => element.id == id);
  }
}

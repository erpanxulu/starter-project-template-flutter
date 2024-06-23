
import 'package:mytodo_mobx_app/features/todo/models/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetchTodos();
}
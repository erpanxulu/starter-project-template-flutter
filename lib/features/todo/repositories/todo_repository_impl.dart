
import 'package:flutter/material.dart';
import 'package:mytodo_mobx_app/core/services/restful/api_service.dart';
import 'package:mytodo_mobx_app/features/todo/models/todo.dart';
import 'package:mytodo_mobx_app/features/todo/repositories/todo_repository.dart';
import 'package:mytodo_mobx_app/injection.dart';

class TodoRepositoryImpl implements TodoRepository {
  final _service = sl<ApiService>();

  @override
  Future<List<Todo>> fetchTodos() async {
    try {
      final result = await _service.getData('/todos');
      debugPrint("dddd222 ${result['data']}");
      final data = result['data'] as List;
      return data.map((e) => Todo.fromJson(e),).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

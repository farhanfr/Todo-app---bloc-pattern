import 'dart:async';
import 'package:crud_bloc_flutter/src/models/todoModels.dart';
import 'package:crud_bloc_flutter/src/resources/todoApiProvider.dart';


class Repository{
  final todoApiProvider = TodoApiProvider();

  Future<List<Todo>> fetchAllTodo() => todoApiProvider.fetchTodoList();
  Future addSaveTodo(String title) => todoApiProvider.addTodo(title);
  Future updateTodo(String ids,int datas) => todoApiProvider.updateTodo(ids,datas);
  
}
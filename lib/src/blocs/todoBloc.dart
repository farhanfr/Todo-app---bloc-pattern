import 'package:crud_bloc_flutter/src/models/todoModels.dart';
import 'package:crud_bloc_flutter/src/resources/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc{
  final repository = Repository();
  final todoFetcher = PublishSubject<List<Todo>>();
  final title = BehaviorSubject<String>();
  final id = BehaviorSubject<String>();
  
  Observable<List<Todo>> get allTodo => todoFetcher.stream;
  Function(String) get updateTitle => title.sink.add;
  Function(String) get getId => id.sink.add;

  fetchAllTodo() async{
    List<Todo> todo = await repository.fetchAllTodo();
    todoFetcher.sink.add(todo);
  }

  addSaveTodo(){
    print(title.value);
    repository.addSaveTodo(title.value);
  }

  updateTodo(int data){
    print(id.value);
    repository.updateTodo(id.value,data);
  }

  dispose(){
    todoFetcher.close();
    title.close(); 
    id.close();
  }
}

final bloc = TodoBloc();
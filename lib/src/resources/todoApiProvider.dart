import 'dart:async';
import 'package:crud_bloc_flutter/src/models/todoModels.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';


class TodoApiProvider{
  Client client = Client();
  final url = "http://192.168.1.2:8000/user/";
  
  Future<List<Todo>> fetchTodoList() async{
    print('masuk');
    final response = await client.get(url + "get/all");
    if(response.statusCode == 200){
      return compute(todoFromJson,response.body);
    }else{
      throw Exception('failed to load');
    }
  }

  Future addTodo(String title) async{
    final response = await client.post(url + "add",body: {
      'name' : title
    });

    if(response.statusCode == 200){
      return response;
    }else{
      throw Exception("failed add data");
    }
  }

  Future updateTodo(ids,datas) async{
    final response = await client.put(url + "update",body: {
      'id':ids,
      'name':"nama",
      'address':"nama alamat",
      'done':datas.toString()
    });
    if(response.statusCode == 200){
      print("update berhasil");
      return response;
    }else{
      throw Exception("failed update data");
    }
  }


 
  
}
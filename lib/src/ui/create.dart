import 'package:crud_bloc_flutter/src/blocs/todoBloc.dart';
import 'package:flutter/material.dart';

class Create extends StatefulWidget {
  @override
  _CreateState createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              onChanged: bloc.updateTitle,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Add new todo'
              ),
            ),
            RaisedButton(
              onPressed: () async{
                bloc.addSaveTodo();
                await Future.delayed(const Duration(milliseconds: 500));
                bloc.fetchAllTodo();
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:crud_bloc_flutter/src/blocs/todoBloc.dart';
import 'package:crud_bloc_flutter/src/models/todoModels.dart';
import 'package:crud_bloc_flutter/src/ui/create.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    bloc.fetchAllTodo();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo list'),
      ),
      body: StreamBuilder(
        stream: bloc.allTodo,
        builder: (context,AsyncSnapshot<List<Todo>> snapshot){
          if(snapshot.hasData){
            return buildList(snapshot);
          }else if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Create()));
      },
      child: Icon(Icons.add),
      ),
    );
  }
  Widget buildList(AsyncSnapshot<List<Todo>> snapshot){
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context,int index){
        bool boolData =  snapshot.data[index].done == 1 ? true : false;
        int intData = snapshot.data[index].done;
        return CheckboxListTile(
          value: boolData,
          title: Text(snapshot.data[index].name),
          subtitle: Text(snapshot.data[index].id.toString()),
          onChanged: (bool isChecked){
            bloc.getId(snapshot.data[index].id.toString());
            if(intData == 1){
              bloc.updateTodo(0);
            }
            else{
              bloc.updateTodo(1);
            }
            bloc.fetchAllTodo();
          },
        );
      },

    );
  }
}
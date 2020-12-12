import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/blocs/blocs.dart';
import 'package:to_do/model/model.dart';

class TodoList extends StatelessWidget {
  @override
  final Todo todo;
  TodoList({@required this.todo});

  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.complete,
        onChanged: (_) {
          BlocProvider.of<TodosBloc>(context).add(
            TodoUpdate(todo.copyWith(complete: !todo.complete)),
          );
        },
      ),
      title: Text(todo.task),
    );
  }
}

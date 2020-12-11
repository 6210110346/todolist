import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/model/model.dart';

class TodoList extends StatelessWidget {
  @override
  final Todo todo;
  TodoList({@required this.todo});

  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.task),
    );
  }
}

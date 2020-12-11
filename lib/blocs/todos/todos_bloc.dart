import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:to_do/model/todo.dart';
import 'package:to_do/widget/widget.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosState(todos: []));

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if (event is TodoLoad) {
      yield TodosState(todos: await _loadToState(state.todos));
    } else if (event is TodoAdd) {
      yield await _addToState(state);
    } else if (event is TodoUpdate) {
      yield await _updateToState(state);
    } else if (event is TodoDelete) {
      yield await _deleteToState(state);
    } else if (event is TodoCompleteAll) {
      yield await _completeAllToState(state);
    } else if (event is TodoClearComplete) {
      yield await _clearCompleteToState(state);
    }
  }

  Future<List<Todo>> _loadToState(state) async {
    final List<Todo> todos = todosList;
    return todos;
  }

  Future<TodosState> _addToState(state) async {}
  Future<TodosState> _updateToState(state) async {}
  Future<TodosState> _deleteToState(state) async {}
  Future<TodosState> _completeAllToState(state) async {}
  Future<TodosState> _clearCompleteToState(state) async {}

  Future<List<Todo>> fetchListTodos() async {
    final todos = todosList;
    return todos;
  }
}

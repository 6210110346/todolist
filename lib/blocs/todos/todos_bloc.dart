import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:to_do/model/todo.dart';
import 'package:to_do/widget/widget.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosState([]));

  @override
  Stream<TodosState> mapEventToState(
    TodosEvent event,
  ) async* {
    if (event is TodoLoad) {
      yield* loadToState();
    } else if (event is TodoAdd) {
      yield await _addToState(state);
    } else if (event is TodoUpdate) {
      yield* await _updateToState(event);
    } else if (event is TodoDelete) {
      yield await _deleteToState();
    } else if (event is TodoCompleteAll) {
      yield await _completeAllToState();
    } else if (event is TodoClearComplete) {
      yield await _clearCompleteToState();
    }
  }

  Stream<TodosState> loadToState() async* {
    yield TodosState(todosList);
  }

  Future<TodosState> _addToState(event) async {}
  Stream<TodosState> _updateToState(TodoUpdate event) async* {
    final List<Todo> updateTodos = (state as TodosState).todos.map((todo) {
      return todo.id == event.todo.id ? event.todo : todo;
    }).toList();
    yield TodosState(updateTodos);
  }

  Future<TodosState> _deleteToState() async {}
  Future<TodosState> _completeAllToState() async {
    final List<Todo> updateTodos = (state as TodosState).todos.map((todo) {
      return todo.copyWith(complete: true);
    }).toList();
    return TodosState(updateTodos);
  }

  Future<TodosState> _clearCompleteToState() async {
    final List<Todo> updateTodos = (state as TodosState).todos.where((todo) {
      return !todo.complete;
    }).toList();
    return TodosState(updateTodos);
  }
}

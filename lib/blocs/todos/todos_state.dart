part of 'todos_bloc.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}

class TodoSuccess extends TodosState {
  List<Todo> todos = [];
}

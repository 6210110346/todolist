part of 'todos_bloc.dart';

@immutable
class TodosState extends Equatable {
  List<Todo> todos = todosList;
  TodosState({this.todos = const []});

  @override
  List<Object> get props => [todos];
}

part of 'todos_bloc.dart';

@immutable
abstract class TodosEvent extends Equatable {}

class TodoLoad extends TodosEvent {
  @override
  List<Object> get props => [];
}

class TodoAdd extends TodosEvent {
  @override
  List<Object> get props => [];
}

class TodoDelete extends TodosEvent {
  @override
  List<Object> get props => [];
}

class TodoUpdate extends TodosEvent {
  @override
  List<Object> get props => [];
}

class TodoCompleteAll extends TodosEvent {
  @override
  List<Object> get props => [];
}

class TodoClearComplete extends TodosEvent {
  @override
  List<Object> get props => [];
}

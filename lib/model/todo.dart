import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Todo extends Equatable {
  String task;
  String note;
  bool complete;
  String id;

  Todo(
    this.task, {
    this.complete = false,
    this.note = '',
    id,
  }) : this.id = id ?? uuid.v4();

  @override
  List<Object> get props => [task, complete, note, id];

  // @override
  // String toString() => 'Todo {complete: $complete, task: $task}';
}

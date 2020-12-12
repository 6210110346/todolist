import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Todo extends Equatable {
  String task;
  String note;
  bool complete;
  String id;

  Todo({
    @required this.task,
    this.complete = false,
    this.note = '',
    id,
  }) : this.id = id ?? uuid.v4();

  Todo copyWith({String task, String note, bool complete, String id}) {
    return Todo(
        task: task ?? this.task,
        note: note ?? this.note,
        complete: complete ?? this.complete,
        id: id ?? this.id);
  }

  @override
  List<Object> get props => [task, complete, note, id];

  // @override
  // String toString() => 'Todo {complete: $complete, task: $task}';
}

List<Todo> todosList = <Todo>[
  Todo(
      task: "how to train your dragon",
      note: 'step one, train your cat before'),
  Todo(
      task: "how to train your cat",
      note: 'step one, give me five hundred dollars'),
];

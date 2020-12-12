import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do/model/model.dart';

part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc() : super(StatsState(0, 0));

  @override
  Stream<StatsState> mapEventToState(
    StatsEvent event,
  ) async* {
    if (event is StatsLoad) {
      yield await _mapLoadToState(event.todos);
    }
  }

  Future<StatsState> _mapLoadToState(List<Todo> todos) async {
    final int activeNum = todos.where((todo) => !todo.complete).toList().length;
    final int completeNum =
        todos.where((todo) => todo.complete).toList().length;
    return state.copyWith(activeNum: activeNum, completeNum: completeNum);
  }
}

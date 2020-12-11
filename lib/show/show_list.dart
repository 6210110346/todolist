import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/blocs/blocs.dart';
import 'package:to_do/model/model.dart';
import 'package:to_do/widget/widget.dart';

class ShowList extends StatelessWidget {
  final _scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    child: TodoList(todo: state.todos[index]),
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _onScroll(BuildContext context) {
    if (_isBottom) BlocProvider.of<TodosBloc>(context).add(TodoLoad());
  }

  bool get _isBottom {
    if (!_scroll.hasClients) return false;
    final maxScroll = _scroll.position.maxScrollExtent;
    final currentScroll = _scroll.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

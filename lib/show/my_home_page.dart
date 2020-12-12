import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/blocs/blocs.dart';
import 'package:to_do/model/model.dart';
import 'package:to_do/show/show.dart';
import 'package:to_do/widget/widget.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        return MaterialApp(
          home: DefaultTabController(
            length: taps.length,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(this.title),
                actions: [
                  PopupMenuButton<ExtraAction>(
                    itemBuilder: (BuildContext context) => [
                      PopupMenuItem(
                        child: BlocProvider(
                          create: (_) => TodosBloc()..add(TodoCompleteAll()),
                          child: Text('Complete All'),
                        ),
                      ),
                      PopupMenuItem(
                        child: Text('Clear Complete'),
                      )
                    ],
                  ),
                ],
              ),
              body: Center(
                child: TabBarView(
                  children: <Widget>[
                    ShowList(),
                    BlocProvider(
                      create: (_) => StatsBloc()..add(StatsLoad(state.todos)),
                      child: Stats(),
                    )
                  ],
                ),
              ),
              bottomNavigationBar: SafeArea(
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: TabBar(
                    unselectedLabelColor: Colors.black,
                    tabs: taps.map((Tap tap) {
                      return Tab(
                        text: tap.title,
                        icon: Icon(tap.icon),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

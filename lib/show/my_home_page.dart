import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do/model/model.dart';
import 'package:to_do/widget/widget.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: taps.length,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(this.title),
            actions: [
              PopupMenuButton<ExtraAction>(
                itemBuilder: (BuildContext context) {
                  return extras.map((ExtraAction extra) {
                    return PopupMenuItem<ExtraAction>(
                      value: extra,
                      child: Text(extra.title),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[Text('manudmaww'), Stats()],
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
  }
}

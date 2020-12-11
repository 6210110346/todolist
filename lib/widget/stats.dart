import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/model/model.dart';

class Stats extends StatelessWidget {
  List<Todo> todos;

  int activeNum = 0;
  int completeNum = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('${activeNum}'),
    );
  }
}

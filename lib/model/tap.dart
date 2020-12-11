import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tap {
  const Tap({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Tap> taps = const <Tap>[
  const Tap(title: 'Home', icon: Icons.home),
  const Tap(title: 'Stats', icon: Icons.call_made),
];

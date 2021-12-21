// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';


import './core_theme.dart';

import './Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = CoreTheme.dark();
    return MaterialApp(
      theme: theme,
      home: Home(),
    );
  }
}

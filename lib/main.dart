// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import './question.dart';
import './core_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}
class MyAppState extends State<MyApp> {
  var ind = 0;
  var l = ['I am Awesome', 'I know I\'m Awesome', 'Everybody Knows I\'m Awesome'];
  
  void btn() {

    setState(() {
      ind = ind+1;
    });


  }
  @override
  Widget build(BuildContext context) {
    final theme = CoreTheme.dark();
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Team AweSome', style: theme.textTheme.headline6),
          
        ),
        body: Column(
          children: <Widget>[
            Question(l[ind]),
            ElevatedButton(
              child: Text('True'),
              onPressed: btn,
            )
          ],
        ),
      ),
    );
  }
}

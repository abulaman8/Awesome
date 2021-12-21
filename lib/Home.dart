// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import './question.dart';
import './core_theme.dart';
import './profile.dart';



class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  var ind = 0;
  var l = [
    'I am Awesome',
    'I know I\'m Awesome',
    'Everybody Knows I\'m Awesome'
  ];

  void btn() {
    setState(() {
      ind = ind + 1;
    });
  }
  void btnf() {
    setState(() {
      ind = ind - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = CoreTheme.dark();
    return Scaffold(
        appBar: AppBar(
          title: Text('Team AweSome', style: theme.textTheme.headline6),
          actions: <Widget>[
            IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Profile())), icon: Icon(Icons.person))
          ],
        ),
        body: Column(
          children: <Widget>[
            Question(l[ind]),
            ElevatedButton(
              child: Text('True'),
              onPressed: btn,
            ),
            ElevatedButton(
              child: Text('False'),
              onPressed: btnf,
            ),
          ],
        ),
      );
  }
}

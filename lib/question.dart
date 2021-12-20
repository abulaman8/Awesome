import 'package:flutter/material.dart';

import './core_theme.dart';
class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    final theme = CoreTheme.dark();
    return Container(
      
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
        
      ),
    );
  }
}

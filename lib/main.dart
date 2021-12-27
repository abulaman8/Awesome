// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import './core_theme.dart';


import './navigate.dart';
import './constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final theme = CoreTheme.dark();
//     return MaterialApp(
//       theme: theme,
//       home: Home(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = CoreTheme.dark();
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: Constants.title,
      initialRoute: '/',
      routes: Navigate.routes,
      theme: theme
    );
  }
}
import 'package:flutter/material.dart';
import './core_theme.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = CoreTheme.dark();
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page', style: theme.textTheme.headline6),
      ),
      body: TextField(
        controller: controller,
      ),
    );
  }
}

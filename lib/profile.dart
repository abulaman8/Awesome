import 'package:firebase_auth/firebase_auth.dart';
import './firebaseAuthentication.dart';
import 'package:flutter/material.dart';
import './core_theme.dart';

class Profile extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  

  
  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final theme = CoreTheme.dark();
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('${user!.displayName!}\'s Profile' , style: theme.textTheme.headline6),
      ),
      body: TextField(
        controller: controller,
      ),
    );
  }
}

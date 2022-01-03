import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/constants.dart';
import './message_box.dart';
import './chatWall.dart';

class DmPage extends StatefulWidget {
  DmPage({Key? key,}) : super(key: key);


  

  @override
  _DmPageState createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map users = ModalRoute.of(context)?.settings.arguments as Map;
    final user = FirebaseAuth.instance.currentUser;
    users['users'].sort();
    final String user1 = users['users'][0];
    final String user2 = users['users'][1];
    final store = FirebaseFirestore.instance.collection('${user1}_${user2}');
    void _addMessage(String value) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await store.add({
        'author': user.displayName ?? 'Anonymous',
        'author_id': user.uid,
        'timestamp': Timestamp.now().millisecondsSinceEpoch,
        'value': value,
      });
    }
  }

    return Scaffold(
      appBar: AppBar(
        title: user1 != user!.displayName ? Text(user1) : Text(user2),
        actions: []
      ),
      backgroundColor: Constants.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: store.orderBy('timestamp').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.docs.isEmpty) {
                    return Center(child: Text('No messages to display'));
                  }

                  return ChatWall(
                    messages: snapshot.data!.docs,
                  );
                }

                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          
          MessageBox(
            onSubmit: _addMessage,
          )
          
        ],
      ),
    );
  }}
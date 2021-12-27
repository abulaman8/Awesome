import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/constants.dart';
import './message_box.dart';
import './chatWall.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key,}) : super(key: key);


  

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((user) {
      
      setState(() {});
    });
  }





  



  @override
  Widget build(BuildContext context) {
    final Map city = ModalRoute.of(context)?.settings.arguments as Map;
    final store = FirebaseFirestore.instance.collection('${city["city"]}_Chat');
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
        title: Text(city['city']),
        centerTitle: true,
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
  }
}

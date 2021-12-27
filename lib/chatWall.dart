import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import './incomingMessage.dart';
import './myMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ChatWall extends StatelessWidget {
  final List<QueryDocumentSnapshot> messages;
  final ScrollController _scrollController = ScrollController();
  

  ChatWall({
    Key? key,
    required this.messages,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final data = messages[index].data() as Map<String, dynamic>;
        final user = FirebaseAuth.instance.currentUser;

        if (user != null && user.uid == data['author_id']) {
          return MyMessage(
              index: index,
              data: data,
            );
        }

        return IncomingMessage(
          index: index,
          data: data,
        );
      },
    );
  }
}
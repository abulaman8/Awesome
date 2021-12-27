// ignore_for_file: file_names, unused_import



import 'package:flutter/material.dart';
import './constants.dart';

class CityDetails extends StatelessWidget {
  // final String name;
  const CityDetails({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map name = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Profile'),
        actions: [IconButton(onPressed:() => Navigator.pushNamed(context, Constants.CityChatNavigate, arguments: {'city' : name['name']}), icon: Icon(Icons.chat))],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            Text(name['name'])
          ]),
        ),
      ),
    );
  }
}

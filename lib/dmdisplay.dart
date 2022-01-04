import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import './constants.dart';

class DmDisplay extends StatefulWidget {
  const DmDisplay({Key? key}) : super(key: key);

  @override
  _DmDisplayState createState() => _DmDisplayState();
}

class _DmDisplayState extends State<DmDisplay> {
  final database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  List senderslist = [];
  void get_data() async {
    final User? user = auth.currentUser;
    var val = await database.child('messages/${user!.displayName}').get().then((snapshot) {
      final data = Map.from(snapshot.value as Map);
      
      setState(() {
        for (var element in data.entries) {
          senderslist.add([element.key, element.value]);
        }
      });
      print(senderslist);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sendersref = database.child('messages');
    final User? user = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        actions: [IconButton(onPressed: get_data, icon: Icon(Icons.refresh))],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            Expanded(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: senderslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () => Navigator.pushNamed(
                                  context, Constants.dmPageNavigate,
                                  arguments: {
                                    'users': [
                                      senderslist[index][1]['name'] as String,
                                      user!.displayName as String
                                    ]
                                  }),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(senderslist[index][1]['dp']),
                            ),
                            title: Text(senderslist[index][1]['name']),
                          ));
                    }),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

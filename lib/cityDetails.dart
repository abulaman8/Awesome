// ignore_for_file: file_names, unused_import





import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './constants.dart';
import 'package:firebase_database/firebase_database.dart';

class CityDetails extends StatefulWidget {
  const CityDetails({Key? key}) : super(key: key);

  @override
  _CityDetailsState createState() => _CityDetailsState();
}

class _CityDetailsState extends State<CityDetails> {
  final database = FirebaseDatabase.instance.ref();
  final FirebaseAuth auth = FirebaseAuth.instance;
  
  List list = [];
        List newlist = [];
  void getData(name) async {
      var val = await database.child('cities/$name').get().then((snapshot) {
        final data = Map.from(snapshot.value as Map);
        
        setState(() {
        for (var element in data.entries) {newlist.add([element.key, element.value]);}
        list = List.from(newlist);

      });
          
        
        
        print(list);
      });
      
    }

  @override
  Widget build(BuildContext context) {
    final Map name = ModalRoute.of(context)?.settings.arguments as Map;
    final User? user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text('City Profile'),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(
                  context, Constants.CityChatNavigate,
                  arguments: {'city': name['name']}),
              icon: Icon(Icons.chat))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(children: [
            Text(name['name']),
            
                  ElevatedButton(onPressed: (){getData(name['name']);}, child: Text('Look for friends around')),
                  Expanded(
                      child: SizedBox(height: 200, child: ListView.builder(
                        shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(list[index][1]['dp']),
                          radius: 15,
                        ),
                        title: Text(list[index][1]['name']),
                        subtitle: Text(list[index][1]['email']),
                        trailing: IconButton(onPressed: () => Navigator.pushNamed(context, Constants.dmPageNavigate, arguments: {'users' : [user!.displayName as String, list[index][1]['name'] as String]}), icon: Icon(Icons.send),
                      ));
                    },
                  ),), ),
                  
                  
                ],
              ),
            ),
          ));
        
      
    
  }
}

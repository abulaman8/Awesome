import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:testapp/constants.dart';
import 'package:flutter/material.dart';
import './core_theme.dart';
import './constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance.ref();
  String roll = '';
  String phone = '';
  String city = '';

  void getData() {
    final User? user = auth.currentUser;

    final userDataRef = database.child('users/${user!.uid}');
    var val = userDataRef.get().then((snapshot) {
      final data = Map.from(snapshot.value as Map);
      setState(() {
        roll = data['roll_number'];
        phone = data['phone_number'];
        city = data['exam_city'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    final User? user = auth.currentUser;
    final theme = CoreTheme.dark();
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('${user!.displayName!}\'s Profile',
            style: theme.textTheme.headline6),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!),
                radius: 55,
              ),
              const SizedBox(height: 100),
              Table(
                border: const TableBorder(horizontalInside: BorderSide(width: 1, color: Constants.cream, style: BorderStyle.solid), top: BorderSide(width: 1, color: Constants.cream, style: BorderStyle.solid), bottom: BorderSide(width: 1, color: Constants.cream, style: BorderStyle.solid),),
                textDirection: TextDirection.ltr,
                
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      const Text('Name : '),
                      Text(user.displayName as String)
                    ],
                  ),
                  const TableRow(
                    children: <Widget>[
                      SizedBox(height: 20),
                      SizedBox(height: 20),

                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      const Text('Email : '),
                      Text(user.email as String)
                    ],
                  ),
                  const TableRow(
                    children: <Widget>[
                      SizedBox(height: 20),
                      SizedBox(height: 20),

                    ],
                  ),
                  TableRow(
                    children: <Widget>[const Text('Roll Number : '), Text(roll)],
                  ),
                  const TableRow(
                    children: <Widget>[
                      SizedBox(height: 20),
                      SizedBox(height: 20),

                    ],
                  ),
                  TableRow(
                    children: <Widget>[const Text('Phone Number : '), Text(phone)],
                  ),
                  const TableRow(
                    children: <Widget>[
                      SizedBox(height: 20),
                      SizedBox(height: 20),

                    ],
                  ),
                  TableRow(
                    children: <Widget>[const Text('Exam City. : '), Text(city)],
                  ),
                ],
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                child: const Text('Edit'),
                onPressed: () =>
                    Navigator.pushNamed(context, Constants.editProfileNavigate),
              )
            ],
          ),
        ),
      ),
    );
  }
}

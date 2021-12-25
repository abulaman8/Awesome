// ignore: file_names
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';


class EditProfile extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final database = FirebaseDatabase.instance.ref();
  final pcontroller = TextEditingController();
  final econtroller = TextEditingController();
  final rcontroller = TextEditingController();
  final String? email = FirebaseAuth.instance.currentUser?.email;
  final String? name = FirebaseAuth.instance.currentUser?.displayName;
  final pos =  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  late Position currentposition;


  @override
  Widget build(BuildContext context) {
    final User? user = auth.currentUser;
    final userDataRef = database.child('users/${user!.uid}');

    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                TextField(
                  controller: pcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
                    hintText: 'Phone Number...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  
                ),
                const SizedBox(height: 20,),
                TextField(
                  controller: rcontroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.input),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
                    hintText: 'Roll Number...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  
                ),
                const SizedBox(height: 20,),

                TextField(
                  controller: econtroller,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_city),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
                    hintText: 'Exam Center...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  
                ),
                const SizedBox(height: 20,),
                
                ElevatedButton(
                  child: const Text('Test set'),
                  onPressed: () async {
                    await userDataRef.set({
                      'name': user.displayName,
                      'roll_number': rcontroller.text,
                      'email': user.email,
                      'exam_city': econtroller.text,
                      'phone_number': pcontroller.text
                    }).catchError(
                        (error) => print('You got an error...$error'));
                    print('user added');
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

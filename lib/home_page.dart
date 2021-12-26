// ignore_for_file: dead_code

import 'package:firebase_auth/firebase_auth.dart';
import './firebaseAuthentication.dart';
import './constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import './cities.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  final formKey = GlobalKey<FormState>();
  final controllerCity = TextEditingController();
  String? selectedCity;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                FirebaseService service = new FirebaseService();
                await service.signOutFromGoogle();
                Navigator.pushReplacementNamed(
                    context, Constants.signInNavigate);
              },
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () =>
                  Navigator.pushNamed(context, Constants.profileNavigate),
            ),
          ],
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Constants.maroon),
          title: const Text("Home"),
        ),
        body: Center(
            child: Padding(padding: const EdgeInsets.all(25),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TypeAheadField(
              suggestionsCallback: (pattern) {
                return CityData.getSuggestions(pattern);
                },
              onSuggestionSelected: (String? suggestion) {
                Navigator.pushNamed(context, Constants.cityDetailsNavigate, arguments: {'name': suggestion});
                },
              itemBuilder: (context, String? suggestion) => ListTile(
                title: Text(suggestion as String),
              ),
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    hintText: 'Search in Your City...'),
              ),
            ),
            const SizedBox(height: 125,),
            Text(user!.email!),
            Text(user!.displayName!),
            CircleAvatar(
              backgroundImage: NetworkImage(user!.photoURL!),
              radius: 20,
            ),
          ],
        )) ));
  }
}

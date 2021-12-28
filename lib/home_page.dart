// ignore_for_file: dead_code

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import './firebaseAuthentication.dart';
import './constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import './cities.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  final database = FirebaseDatabase.instance.ref();
  final formKey = GlobalKey<FormState>();
  final controllerCity = TextEditingController();
  String? selectedCity;
  Position? currentPosition;
  String? currentLocationAddress;

  @override
  void initState() {
    super.initState();
  }
  
  getCurrentLocation() async{
    bool serviceEnabled;
    LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    if (permission == LocationPermission.denied) {
      
      return Future.error(
          'Location permissions are denied');
    }
  }
    await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
    forceAndroidLocationManager: true)
    .then((Position position) {
    setState(() {
        currentPosition = position;
        getCurrentLocationAddress();
    });
}).catchError((e) {
    print(e);
});
print('this works');
print(currentPosition);
}

getCurrentLocationAddress() async {
try {
List<Placemark> listPlaceMarks = await placemarkFromCoordinates(
currentPosition!.latitude, currentPosition!.longitude);
Placemark place = listPlaceMarks[0];
final userDataRef = database.child('users/${user!.uid}');
await userDataRef.update({'location' : '${place.locality}'});

setState(() {
    currentLocationAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
    }
);
} catch (e) {
    print(e);
}
print('this works too!!');

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
                    hintText: 'Search for a  City...'),
              ),
            ),
            SizedBox(height: 20,),
             if (currentPosition != null) Text('LAT: ${currentPosition!.latitude}', style: TextStyle(fontSize: 23, color: Colors.white),),
    SizedBox(height: 15),
    if (currentPosition != null) Text('LONG: ${currentPosition!.longitude}', style: TextStyle(fontSize: 23),),
    SizedBox(height: 15),
    if (currentLocationAddress != null) Text(currentLocationAddress as String, style: TextStyle(fontSize: 23),),
    SizedBox(height: 25),
    ElevatedButton(
        child: Text('Get Current Location',
        style: TextStyle(fontSize: 22, color: Colors.white)),
        onPressed: () {
            getCurrentLocation();
        },
        style: ElevatedButton.styleFrom(primary: Constants.maroon),
    ),
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

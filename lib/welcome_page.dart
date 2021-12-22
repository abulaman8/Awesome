import 'package:firebase_auth/firebase_auth.dart';
import './constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    User? result = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Constants.grey,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: Constants.statusBarColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                ),
                SizedBox(height: 125),
                SizedBox(
                  width: size.width * 0.8,
                  child: OutlinedButton(
                    onPressed: () {
                      result == null
                          ? Navigator.pushNamed(
                              context, Constants.signInNavigate)
                          : Navigator.pushReplacementNamed(
                              context, Constants.homeNavigate);
                    },
                    child: Text(Constants.textStart),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Constants.cream),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Constants.maroon),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

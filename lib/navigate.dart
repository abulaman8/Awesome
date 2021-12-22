import './home_page.dart';
import './sign_in_page.dart';
import './welcome_page.dart';
import './profile.dart';
import 'package:flutter/material.dart';




class Navigate {
  static Map<String, Widget Function(BuildContext)> routes =   {
    '/' : (context) => WelcomePage(),
    '/sign-in' : (context) => SignInPage(),
    '/home'  : (context) => HomePage(),
    '/profile' : (context) => Profile(),
  };
}

import './home_page.dart';
import './sign_in_page.dart';
import './welcome_page.dart';
import './profile.dart';
import './editProfile.dart';
import './cityDetails.dart';
import './chatPage.dart';
import './dmpage.dart';
import 'package:flutter/material.dart';




class Navigate {
  static Map<String, Widget Function(BuildContext)> routes =   {
    '/' : (context) => WelcomePage(),
    '/sign-in' : (context) => SignInPage(),
    '/home'  : (context) => HomePage(),
    '/profile' : (context) => Profile(),
    '/editProfile' : (context) => EditProfile(),
    '/cityDetails' : (context) => CityDetails(),
    '/cityChat' : (context) => ChatPage(),
    '/dmPage' : (context) => DmPage(),

  };

  static get name => null;
}
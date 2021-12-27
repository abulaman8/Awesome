import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/cityDetails.dart';
import './core_theme.dart';

class Constants {
  //colors
  static const cream = CoreTheme.cream;
  static const LightGreyColor = Color(0xFFEEEEEE);
  static const BlackColor = Color(0xFF000000);
  static const grey = CoreTheme.grey;
  static const maroon = CoreTheme.maroon;
  static const BorderColor = Color(0xFFEFEFEF);
  static const beige = CoreTheme.beige;

  //cites
  static const List<String> cities = ['Chennai', 'Madurai', 'New Delhi', 'Kalaburagi', 'Hyderabad', 'Mumbai', 'Kolkata', 'Trichy', 'Pondicherry'];

  //text
  static const title = "Google Sign In";
  
  static const textStart = "Get Started";
  static const textSignInGoogle = "Sign In With Google";
  static const textHome = "Home";

  //navigate
  static const signInNavigate = '/sign-in';
  static const homeNavigate = '/home';
  static const profileNavigate = '/profile';
  static const editProfileNavigate = '/editProfile';
  static const cityDetailsNavigate = '/cityDetails';
  static const CityChatNavigate = '/cityChat';

  static const statusBarColor = SystemUiOverlayStyle(
      statusBarColor: Constants.cream,
      statusBarIconBrightness: Brightness.dark);
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  static const List<String> cities = ['Anantapur', 'Bhimavaram', 'Guntur', 'Kadapa', 'Kurnool', 'Rajahmundry', 'Tirupathi', 'Vijayawada', 'Vishakhapatnam', 'Naharlagun', 'Guwahati', 'Silchar', 'Tezpur', 'Patna', 'Raipur', 'Delhi', 'Panaji', 'Ahmedabad', 'Anand', 'Rajkot', 'Surat', 'Vadodara', 'Faridabad', 'Gurgaon', 'Hamirpur', 'Shimla', 'Jammu', 'Srinagar', 'Dhanbad', 'Jamshedpur', 'Ranchi', 'Belgaum', 'Bengaluru', 'Dharwad', 'Gulbarga', 'Mangalore', 'Mysore', 'Calicut', 'Ernakulam', 'Kollam', 'Kottayam', 'Palakkad', 'Thrissur', 'Trivandrum', 'Bhopal', 'Gwalior', 'Indore', 'Amravati', 'Aurangabad', 'Jalgaon', 'Kolhapur', 'Mumbai', 'Nagpur', 'Nanded', 'Nashik', 'Pune', 'Solapur', 'Imphal', 'Shillong', 'Aizawl', 'Dimapur', 'Bhubaneswar', 'Rourkela', 'Puducherry', 'Chandigarh', 'Jalandhar', 'Ludhiana', 'Jaipur', 'Jodhpur', 'Kota', 'Udaipur', 'Bardang', 'Chennai-Avadi', 'Chennai-South', 'Coimbatore', 'Erode', 'Kanchipuram', 'Madurai', 'Salem', 'Thanjavur', 'Tiruchirappalli', 'Tirunelveli', 'Vellore', 'Hyderabad', 'Warangal', 'Agartala', 'Agra', 'Allahabad', 'Ghaziabad', 'Greater Noida', 'Kanpur', 'Lucknow', 'Meerut', 'Varanasi', 'Dehradun', 'Roorkee', 'Aasansol', 'Adisaptagram', 'Durgapur', 'Kolkata', 'Port Blair', 'Sambalpur', 'Gorakhpur', 'Haldwani', 'Siliguri', 'Bhagalpur', 'Darbhanga', 'Gaya', 'Muzzafurpur', 'Jabalpur', 'Amritsar', 'Singapore', 'Colombo', 'Jaffna', 'Dubai', 'Hamdan', 'Muscat', 'Sharjah'];

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
  static const dmPageNavigate = '/dmPage';


  static const statusBarColor = SystemUiOverlayStyle(
      statusBarColor: Constants.cream,
      statusBarIconBrightness: Brightness.dark);
}
import 'package:flutter/material.dart';

// Define the light theme
final lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  primaryColor: Colors.blue, // Custom primary color for light theme
  hintColor: Colors.green, // Custom accent color for light theme
  backgroundColor: Colors.white, // Custom background color for light theme
  // Define text styles for light theme
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
);

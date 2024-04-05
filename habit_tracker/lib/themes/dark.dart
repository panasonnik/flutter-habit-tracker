import 'package:flutter/material.dart';

// Define the dark theme
final darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.deepPurple, // Custom primary color for dark theme
  hintColor: Colors.orange, // Custom accent color for dark theme
  backgroundColor: const Color.fromARGB(
      255, 69, 69, 69), // Custom background color for dark theme
  // Define text styles for dark theme
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white),
  ),
);

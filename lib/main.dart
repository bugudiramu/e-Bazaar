import 'package:flutter/material.dart';
import 'screens/loginPage.dart';

void main() => runApp(
      MaterialApp(
        title: "e-Bazaar",
        debugShowCheckedModeBanner: false,
        home: Login(),
        theme:
            ThemeData(brightness: Brightness.light, fontFamily: 'Montserrat'),
        darkTheme:
            ThemeData(brightness: Brightness.dark, fontFamily: 'Montserrat'),
      ),
    );

// Mostly Used Components
// ₹
//  color: Color(0xFFB33771)

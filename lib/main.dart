import 'package:flutter/material.dart';
import 'screens/loginPage.dart';


void main() => runApp(
      MaterialApp(
        title: "e-Bazaar",
        debugShowCheckedModeBanner: false,
        home: Login(),
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Montserrat',
        ),
        darkTheme:
            ThemeData(brightness: Brightness.dark, fontFamily: 'Montserrat'),
      ),
    );

// Mostly Used Components
// ₹
//  color: Color(0xFFB33771)
// For Android-X error use multiDexEnabled true in app(build.gradle) defaultConfig {}
// android.useAndroidX=true, android.enable Jetifier=true in gradle.properties

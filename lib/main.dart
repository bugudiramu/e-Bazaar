import 'package:flutter/material.dart';
import 'ui/homepage.dart';

void main() => runApp(
      MaterialApp(
        title: "e-Bazaar",
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          brightness: Brightness.light,
          // primarySwatch: Colors.red,
          // primaryColor: Colors.red
        ),
        darkTheme: ThemeData(brightness: Brightness.dark),
      ),
    );

import 'package:flutter/material.dart';
import 'package:wed_assignment/views/screens/search_screen.dart';
import 'package:wed_assignment/views/shared/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Searchly',
      theme: ThemeData(
        primaryColor: kDarkBackground,
        accentColor: kDarkAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SearchScreen(),
    );
  }
}

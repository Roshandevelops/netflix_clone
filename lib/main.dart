import 'package:flutter/material.dart';
import 'package:netflix_project/view/all_screens/all_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),

      // iconTheme: IconThemeData(color: Colors.black),
      // textTheme: TextTheme(
      //   bodySmall: TextStyle(color: Colors.white),
      //   bodyMedium: TextStyle(color: Colors.white),
      //   bodyLarge: TextStyle(color: Colors.white),
      // ),

      debugShowCheckedModeBanner: false,
      home: AllScreens(),
    );
  }
}

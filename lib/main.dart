import 'package:flutter/material.dart';
import 'package:netflix_project/view/all_screens/all_screens.dart';
import 'package:netflix_project/widgets/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: kWhiteColor),
          bodyMedium: TextStyle(color: kWhiteColor),
          bodyLarge: TextStyle(color: kWhiteColor),
        ),
        iconTheme: const IconThemeData(color: kWhiteColor),
      ),

      // theme: ThemeData.dark(),
      // darkTheme: ThemeData.light(),

      // iconTheme: IconThemeData(color: Colors.black),

      debugShowCheckedModeBanner: false,
      home: const AllScreens(),
    );
  }
}

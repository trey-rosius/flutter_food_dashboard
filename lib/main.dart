import 'package:flutter/material.dart';
import 'package:food_dashboard/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Dashboard',
      theme: ThemeData(

        primaryColor: Color(0xFF158876),
        accentColor: Color(0xFFf3711b)
      ),
      home: HomeScreen(),
    );
  }
}

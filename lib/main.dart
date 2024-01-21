import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khetiharii/screens/welcome_screen.dart';
import 'package:khetiharii/theme/theme.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:khetiharii/screens/welcome_screen.dart';
import 'package:khetiharii/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KhetihariiApp());
}

class KhetihariiApp extends StatelessWidget {
  const KhetihariiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khetiharii',
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}

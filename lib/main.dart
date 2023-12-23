import 'package:flutter/material.dart';
import 'package:prova_target_sistemas/screens/information_capture_screen.dart';
import 'package:prova_target_sistemas/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InformationCaptureScreen(),
    );
  }
}

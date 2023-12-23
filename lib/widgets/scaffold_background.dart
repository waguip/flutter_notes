import 'package:flutter/material.dart';

class ScaffoldBackground extends StatelessWidget {
  const ScaffoldBackground({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 28, 78, 98),
              Color.fromARGB(255, 44, 150, 143),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: const Center(
        child: Text(
            'Welcome to your Digital Journal!',
            textScaleFactor: 1.75
        ),
      ),
    );
  }
}
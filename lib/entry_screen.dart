import 'package:flutter/material.dart';

class Entries extends StatelessWidget {
  const Entries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
            'View past entries here',
            textScaleFactor: 1.75
        )
    );
  }
}
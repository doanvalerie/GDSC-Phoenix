import 'package:flutter/material.dart';

class NewEntry extends StatelessWidget {
  const NewEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
          'Make a new Entry here',
          textScaleFactor: 1.75
      ),
    );
  }
}

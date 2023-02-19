import 'package:flutter/material.dart';

class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: const Center(
        child: Text(
          'View past entries here',
          textScaleFactor: 1.75
        ),
      ),
    );
  }
}

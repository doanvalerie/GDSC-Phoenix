import 'package:flutter/material.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: const Center(
        child: Text(
          'Make a new entry here',
          textScaleFactor: 1.75,
        ),
      ),
    );
  }
}



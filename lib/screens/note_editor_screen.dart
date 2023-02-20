import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_phoenix/main.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  String date = DateTime.now().toString();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add an entry."),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
            ),
            const SizedBox(height: 8.0),
            Text(date),
            const SizedBox(height: 28.0),
            TextField(
              controller: _mainControlller,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Enter your entry.",
              ),
            ),
            FloatingActionButton.extended(
              label: const Text('Done'),
              icon: const Icon(Icons.add),
              onPressed: () async {
                FirebaseFirestore.instance.collection("Entries").add({
                  "title": _titleController.text,
                  "date": date,
                  "note": _mainControlller.text,
                }).then((value) {
                  selectedIndexGlobal.value = 0;
                }).catchError((error) =>
                  print("Failled to add note due to $error"));
              }
            ),
          ],
        ),
      ),
    );
  }
}



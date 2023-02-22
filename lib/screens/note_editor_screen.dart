import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_phoenix/main.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  String date =
      ("${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year} at ${timeString(DateTime.now().hour, DateTime.now().minute)}");
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add an entry."),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.edit),
                    hintText: "Title",
                  ),
                ),
                TextFormField(
                  controller: _mainControlller,
                  minLines: 10,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    hintText: "Enter your entry.",
                  ),
                ),
                Text(date),
                const SizedBox(height: 28.0),
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
                          print("Failled to add entry due to $error"));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

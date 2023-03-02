import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_phoenix/format/time.dart';

class NoteUpdaterScreen extends StatefulWidget {
  const NoteUpdaterScreen({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  State<NoteUpdaterScreen> createState() => _NoteUpdaterScreenState();
}

class _NoteUpdaterScreenState extends State<NoteUpdaterScreen> {
  final CollectionReference _foldersReference = FirebaseFirestore.instance.collection("Folders");
  final CollectionReference _entriesReference = FirebaseFirestore.instance.collection("Entries");
  late final TextEditingController _titleController = TextEditingController(text: widget.doc["title"]);
  late final TextEditingController _mainControlller = TextEditingController(text: widget.doc["note"]);
  String date =
      ("${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}"
      " at ${timeString(DateTime.now().hour, DateTime.now().minute)}");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit entry"),
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
                  minLines: 13,
                  maxLines: 13,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    hintText: "Enter your entry.",
                  ),
                ),
                Text(date),
                const SizedBox(height: 28.0),
                FloatingActionButton.extended(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: const Text('Done'),
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    updateData();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateData() async {
    String id = widget.doc["id"];
    Map<String, String> dataToUpdate = {
      "title": _titleController.text,
      "note": _mainControlller.text,
    };
    _foldersReference.doc(widget.doc["folder_name"]).collection("Entries").doc(id).update(dataToUpdate);
    Query query = _entriesReference.where("id", isEqualTo: id);
    QuerySnapshot querySnapshot = await query.get();
    for (var doc in querySnapshot.docs) {
      doc.reference.update(dataToUpdate);
    }
  }
}

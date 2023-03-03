import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_phoenix/screens/folder_reader_screen.dart';
import 'note_updater_screen.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  final CollectionReference _foldersReference = FirebaseFirestore.instance.collection("Folders");
  final CollectionReference _entriesReference = FirebaseFirestore.instance.collection("Entries");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Viewing Entry"),
        actions: [
          IconButton(
            onPressed: () async {
              String id = widget.doc["id"];
              Query query = _entriesReference.where("id", isEqualTo: id);
              QuerySnapshot querySnapshot = await query.get();
              for (var doc in querySnapshot.docs) {
                doc.reference.delete();
              }
              _foldersReference.doc(widget.doc["folder_name"]).collection("Entries").doc(id).delete();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["title"],
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.normal,
                fontFamily: 'Georgia',
              ),
            ),
            Row(
              children: [
                Text(widget.doc["folder_name"]),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text("•"),
                ),
                Expanded(
                  child: Opacity(opacity: .8, child: Text(widget.doc["date"])),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(height: 18.0),
            Text(
              widget.doc["note"],
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NoteUpdaterScreen(doc: widget.doc),
            ),
          );
        },
        child: const Icon(Icons.edit_note),
      ),
    );

  }
}

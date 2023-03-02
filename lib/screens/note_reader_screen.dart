import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NoteReaderScreen extends StatefulWidget {
  const NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Viewing Entry"),
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
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
    );
  }
}

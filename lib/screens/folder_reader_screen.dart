import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/entry_display.dart';
import 'note_reader_screen.dart';

String folder_title = "";
class FolderReaderScreen extends StatefulWidget {
  FolderReaderScreen(this.doc, folder_name, {Key? key}) : super(key: key){folder_title=folder_name;}
  final QueryDocumentSnapshot doc;

  @override
  State<FolderReaderScreen> createState() => _FolderReaderScreenState();
}

class _FolderReaderScreenState extends State<FolderReaderScreen> {
  Stream<QuerySnapshot<Object>> getStream() {
    return  FirebaseFirestore.instance.collection("Folders").doc(folder_title).collection("Entries").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          folder_title,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: getStream(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView(
                    padding: const EdgeInsets.all(8),
                    children: snapshot.data!.docs.map<Widget>((note) => entryDisplay((){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              NoteReaderScreen(note),
                        ),
                      );
                    }, note)).toList(),
                  );
                }
                return const Text(
                  "Create your first entry.",
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
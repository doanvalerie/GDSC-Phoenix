import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gdsc_phoenix/widgets/folder_display.dart';
import 'package:google_fonts/google_fonts.dart';
import 'entry_screen.dart';
import 'folder_reader_screen.dart';
import 'note_reader_screen.dart';
import '../widgets/entry_display.dart';
class EntryScreen extends StatefulWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {
  late TextEditingController controller;
  @override
  void initState(){
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream:
                  FirebaseFirestore.instance.collection("Folders").snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                          children: snapshot.data!.docs
                              .map<Widget>((folder) => FolderDisplay((){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FolderReaderScreen(folder, folder["title"]),
                              ),
                            );
                          }, folder)).toList(),
                      );
                    }
                    return const Text(
                      "Create your first folder.",
                    );
                  }
              ),
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final name = await openDialogue();
          openDialogue();
          FirebaseFirestore.instance.collection("Folders").doc(name).set({"title":name}).then((value) {}).catchError((error) =>
              print("Failled to add entry due to $error"));

        },
        label: Text ("Add Folder"),
        icon: Icon(Icons.add)
      ),
    );
  }
  Future<String?> openDialogue() => showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Folder Name'),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(hintText: 'Enter the folder name'),
          controller: controller,
        ),
        actions: [
          TextButton(onPressed: submit, child: Text('DONE'))
        ],
      ),
  );
  void submit(){
    Navigator.of(context).pop(controller.text);
  }
}

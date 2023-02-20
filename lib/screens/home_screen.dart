import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'note_reader_screen.dart';
import '../widgets/entry_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Your Recent Entries",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                FirebaseFirestore.instance.collection("Entries").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: snapshot.data!.docs
                          .map<Widget>((note) => entryDisplay((){
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
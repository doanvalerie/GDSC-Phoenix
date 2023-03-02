import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'navigation_bar.dart';
import 'package:gdsc_phoenix/format/time.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({Key? key}) : super(key: key);

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}
List<DropdownMenuItem<String>> l = [
  const DropdownMenuItem(
    value: "Unfiled",
    child: Text("Unfiled")
  )
];

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  Object _dropDownValue = "Unfiled";

  void dropDownCallback(Object? selectedValue) {
    if (selectedValue is Object) {
      setState((){
        _dropDownValue = selectedValue;
      });
    }
  }
  String date =
      ("${DateTime.now().month}/${DateTime.now().day}/${DateTime.now().year}"
       " at ${timeString(DateTime.now().hour, DateTime.now().minute)}");
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainControlller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
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
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Folders").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData){
                    return DropdownButton(
                      value: _dropDownValue.toString(),
                        items: snapshot.data!.docs.map((map) => DropdownMenuItem(
                          value: map["title"],
                          child: Text(map["title"]),
                        )).toList(),
                      onChanged: dropDownCallback
                    );
                  }
                  else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
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
                onPressed: () async {
                  FirebaseFirestore.instance.collection("Entries").add({
                    "title": _titleController.text,
                    "date": date,
                    "note": _mainControlller.text,
                    "folder_name": _dropDownValue.toString(),
                  }).then((value) {
                    selectedIndexGlobal.value = 0;
                  });
                  FirebaseFirestore.instance.collection("Folders")
                    .doc(_dropDownValue.toString()).collection("Entries").add({
                      "title": _titleController.text,
                      "date": date,
                      "note": _mainControlller.text,
                      "folder_name": _dropDownValue.toString(),
                    }).then((value) {
                      selectedIndexGlobal.value = 0;
                    }
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

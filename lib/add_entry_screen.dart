import 'package:flutter/material.dart';
import 'home_screen.dart';
/* import 'package:provider/provider.dart';
import 'Providers/entry_data_provider'; */

class NewEntry extends StatefulWidget {
  const NewEntry({Key? key}) : super(key: key);

  @override
  State<NewEntry> createState() => _NewEntryState();
}

class _NewEntryState extends State<NewEntry> {
  late String entryText;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: const Text('Write a new entry', textScaleFactor: 1.75),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextFormField(
                  onChanged: (value) => entryText = value,
                  minLines: 15,
                  maxLines: 15,
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
                  )),
            ),
            FloatingActionButton.extended(
              onPressed: () => {
                // ignore: avoid_print
                print(entryText),
                const Home(),
              },
              label: const Text('Done'),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/entry_screen.dart';
import 'screens/note_editor_screen.dart';
import 'screens/settings_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DigitalJournal());
}

class DigitalJournal extends StatelessWidget {
  const DigitalJournal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
          )
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        indicatorColor: Colors.white,
      ),
      title: "Digital Journal",
      home: MyNavigationBar(),
    );
  }
}

ValueNotifier selectedIndexGlobal = ValueNotifier(0);

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30, fontWeight: FontWeight.bold
  );
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    EntryScreen(),
    NoteEditorScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndexGlobal.value = index;
    });
  }

  Widget _navigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          label: 'All Entries',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'New Entry',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: selectedIndexGlobal.value,
      onTap: _onItemTapped,
      iconSize: 40,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.blue.shade200,
      unselectedItemColor: Colors.blue.shade200.withOpacity(.60),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexGlobal,
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("My Journal"),
            leading:
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit_note)
              ),
          ),
          body: _widgetOptions.elementAt(selectedIndexGlobal.value),
          bottomNavigationBar: _navigationBar(),
        );
      },
    );
  }
}
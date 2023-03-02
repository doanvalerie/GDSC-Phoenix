import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'entry_screen.dart';
import 'note_editor_screen.dart';
import 'settings_screen.dart';

ValueNotifier selectedIndexGlobal = ValueNotifier(0);

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
      selectedItemColor: (Theme.of(context).brightness == Brightness.light)
          ? Theme.of(context).primaryColor
          : Colors.white,
      unselectedItemColor: (Theme.of(context).brightness == Brightness.light)
          ? Theme.of(context).primaryColor.withOpacity(.6)
          : Colors.white.withOpacity(.6),
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
            backgroundColor: Theme.of(context).primaryColor,
            leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit_note)),
          ),
          body: _widgetOptions.elementAt(selectedIndexGlobal.value),
          bottomNavigationBar: _navigationBar(),
        );
      },
    );
  }
}
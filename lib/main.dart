//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/entry_screen.dart';
import 'screens/note_editor_screen.dart';
import 'screens/settings_screen.dart';
import 'package:dynamic_themes/dynamic_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DigitalJournal());
}

class AppThemes {
  static const int lightGray = 0;
  static const int lightRed = 1;
  static const int lightOrange = 2;
  //static const int lightYellow = 3;
  static const int lightGreen = 4;
  static const int lightBlue = 5;
  static const int lightPurple = 6;
  static const int lightPink = 7;
  static const int dark = 8;
}

final themeCollection = ThemeCollection(
  themes: {
    AppThemes.lightGray: ThemeData(primarySwatch: Colors.grey),
    AppThemes.lightRed: ThemeData(primarySwatch: Colors.red),
    AppThemes.lightOrange: ThemeData(primarySwatch: Colors.orange),
    //AppThemes.lightYellow: ThemeData(primarySwatch: Colors.yellow),
    AppThemes.lightGreen: ThemeData(primarySwatch: Colors.green),
    AppThemes.lightBlue: ThemeData(primarySwatch: Colors.blue),
    AppThemes.lightPurple: ThemeData(primarySwatch: Colors.purple),
    AppThemes.lightPink: ThemeData(primarySwatch: Colors.pink),
    AppThemes.dark: ThemeData.dark(),
  },
  fallbackTheme: ThemeData(primarySwatch: Colors.grey),
);

class DigitalJournal extends StatelessWidget {
  const DigitalJournal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        themeCollection: themeCollection,
        defaultThemeId: AppThemes.lightBlue,
        builder: ((context, themeData) {
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              brightness: themeData.brightness,
              textTheme:
                  GoogleFonts.mulishTextTheme(Theme.of(context).textTheme.apply(
                        bodyColor: (themeData.brightness == Brightness.light)
                            ? Colors.black
                            : Colors.white,
                      )),
              primaryColor: themeData.primaryColor,
              indicatorColor: themeData.indicatorColor,
              /* primaryColorDark: (themeData.brightness == Brightness.light)
                  ? themeData.primaryColorDark
                  : themeData.primaryColorLight, */
            ),
            title: "Digital Journal",
            home: const MyNavigationBar(),
          );
        }));
  }
}

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

String timeAmPm(int hour) {
  if (hour >= 12) {
    return "PM";
  } else {
    return "AM";
  }
}

int hourConversion(int hour) {
  if (hour > 12) {
    return hour - 12;
  } else if (hour == 0) {
    return hour + 12;
  } else {
    return hour;
  }
}

String timeString(int hour, int minute) {
  String ts = "";
  ts += "${hourConversion(hour).toString()}:";
  if (minute < 10) {
    ts += "0";
  }
  ts += "${minute.toString()} ${timeAmPm(hour)}";
  return ts;
}

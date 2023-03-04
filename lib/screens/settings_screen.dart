import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_phoenix/format/app_themes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropdownValue = 'Gray';
  var items = [
    'Gray',
    'Red',
    'Orange',
    'Green',
    'Blue',
    'Purple',
    'Pink',
    'Dark',
  ];

  @override
  Widget build(BuildContext context) {
    return Column (
      children: <Align> [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding (
            padding: EdgeInsets.only(left: 10, right: 10, top: 25),
            child: Text(
                "Select Theme:",
                style: TextStyle(fontSize: 20)
            ),
          )
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: DropdownButton(
                value: dropdownValue,
                isExpanded: true,
                itemHeight: 80,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    if (dropdownValue == 'Gray') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightGray);
                    } else if (dropdownValue == 'Red') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightRed);
                    } else if (dropdownValue == 'Orange') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightOrange);
                    } else if (dropdownValue == 'Green') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightGreen);
                    } else if (dropdownValue == 'Blue') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightBlue);
                    } else if (dropdownValue == 'Purple') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightPurple);
                    } else if (dropdownValue == 'Pink') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightPink);
                    } else if (dropdownValue == 'Dark') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.dark);
                    }
                  });
                }
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: const <Padding>[
              Padding (
                padding: EdgeInsets.only(left:10),
                child: Text(
                  "Help: ",
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1
                  ),
                ),
              ),
              Padding (
                padding: EdgeInsets.only(left: 5, right: 10),
                child: Icon(
                  Icons.help
                )
              ),
            ],
          )
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding (
            padding: EdgeInsets.only(left:10, right: 10, top: 20),
            child:  Text(
                "Welcome to your digital journal! "
                    "This app allows you to easily "
                    "keep all your notes in the same place."
            )
          )
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Padding (
                padding: EdgeInsets.only(left:10, right: 10, top: 17),
                child:  Text(
                        "New Entry: ",
                    style: TextStyle(fontWeight: FontWeight.bold)
                )
            )
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Padding (
                padding: EdgeInsets.only(left:10, right: 10, top: 2),
                child:  Text(
                        "Make a new entry using the \"new entry\" button "
                        "on the navigation bar. "
                        "Give your entry a title, select the folder you want "
                        "to store it in, and click \"done\" "
                        "to save the entry"
                )
            )
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Padding (
                padding: EdgeInsets.only(left:10, right: 10, top: 17),
                child:  Text(
                    "Accessing Old Entries: ",
                    style: TextStyle(fontWeight: FontWeight.bold)
                )
            )
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Padding (
                padding: EdgeInsets.only(left:10, right: 10, top: 1),
                child:  Text(
                    "Use the \"All Entries\" button"
                        "on the navigation bar to access past entries, organize, and edit them if needed"
                )
            )
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Padding (
                padding: EdgeInsets.only(left:10, right: 10, top: 17),
                child:  Text(
                    "Home:",
                    style: TextStyle(fontWeight: FontWeight.bold)
                )
            )
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Padding (
                padding: EdgeInsets.only(left:10, right: 10, top: 1),
                child:  Text(
                   "You can see your most recent entries on the home page for easy access"
                )
            )
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Padding (
                padding: EdgeInsets.only(left:10, right: 10, top: 17),
                child:  Text(
                        "Themes: ",
                    style: TextStyle(fontWeight: FontWeight.bold)
                )
            )
        ),
        const Align(
            alignment: Alignment.topLeft,
            child: Padding (
                padding: EdgeInsets.only(left:10, right: 10, top: 1),
                child:  Text(
                    "Change color themes of the app using the drop down on the top of this page"
                )
            )
        ),
        ]
      );
  }
}

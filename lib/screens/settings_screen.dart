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
    return Center(
      child: DropdownButton(
        value: dropdownValue,
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
    );
  }
}

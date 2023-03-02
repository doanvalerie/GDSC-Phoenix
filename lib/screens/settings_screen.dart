import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_phoenix/format/app_themes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropdownValue = 'Select a theme';
  var items = [
    'Select a theme',
    'Light Gray',
    'Light Red',
    'Light Orange',
    'Light Green',
    'Light Blue',
    'Light Purple',
    'Light Pink',
    'Dark',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              "App Theme",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            DropdownButton(
                alignment: Alignment.topLeft,
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
                    } else if (dropdownValue == 'Light Red') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightRed);
                    } else if (dropdownValue == 'Light Orange') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightOrange);
                    } else if (dropdownValue == 'Light Green') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightGreen);
                    } else if (dropdownValue == 'Light Blue') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightBlue);
                    } else if (dropdownValue == 'Light Purple') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightPurple);
                    } else if (dropdownValue == 'Light Pink') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.lightPink);
                    } else if (dropdownValue == 'Dark') {
                      DynamicTheme.of(context)?.setTheme(AppThemes.dark);
                    }
                  });
                }),
          ],
        ),
      ),
    );
  }
}

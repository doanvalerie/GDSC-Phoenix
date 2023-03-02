import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_phoenix/themes/app_themes.dart';

class _MyColor {
  const _MyColor(this.color, this.name);

  final Color color;
  final String name;
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /* var colorChoices = [
    const _MyColor(Colors.pink, 'pink'),
    const _MyColor(Colors.green, 'green'),
  ]; */

  String dropdownvalue = 'Gray';
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
          value: dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownvalue = newValue!;
              if (dropdownvalue == 'Gray') {
                DynamicTheme.of(context)?.setTheme(AppThemes.lightGray);
              } else if (dropdownvalue == 'Red') {
                DynamicTheme.of(context)?.setTheme(AppThemes.lightRed);
              } else if (dropdownvalue == 'Orange') {
                DynamicTheme.of(context)?.setTheme(AppThemes.lightOrange);
              } else if (dropdownvalue == 'Green') {
                DynamicTheme.of(context)?.setTheme(AppThemes.lightGreen);
              } else if (dropdownvalue == 'Blue') {
                DynamicTheme.of(context)?.setTheme(AppThemes.lightBlue);
              } else if (dropdownvalue == 'Purple') {
                DynamicTheme.of(context)?.setTheme(AppThemes.lightPurple);
              } else if (dropdownvalue == 'Pink') {
                DynamicTheme.of(context)?.setTheme(AppThemes.lightPink);
              } else if (dropdownvalue == 'Dark') {
                DynamicTheme.of(context)?.setTheme(AppThemes.dark);
              }
            });
          }),
    );
  }
}

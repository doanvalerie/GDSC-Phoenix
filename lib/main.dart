import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'format/app_themes.dart';
import 'screens/navigation_bar.dart';
import 'package:dynamic_themes/dynamic_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DigitalJournal());
}

class DigitalJournal extends StatelessWidget {
  const DigitalJournal({Key? key}) : super(key: key);
q
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      themeCollection: themeCollection,
      defaultThemeId: AppThemes.lightBlue,
      builder: ((context, themeData) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            brightness: themeData.brightness,
            textTheme: GoogleFonts.mulishTextTheme(
              Theme.of(context).textTheme.apply(
                    bodyColor: (themeData.brightness == Brightness.light)
                        ? const Color.fromARGB(255, 43, 43, 43)
                        : const Color.fromARGB(255, 241, 241, 241),
                  ),
            ),
            primaryColor: themeData.primaryColor,
            indicatorColor: themeData.indicatorColor,
          ),
          title: "Digital Journal",
          home: const MyNavigationBar(),
        );
      }),
    );
  }
}

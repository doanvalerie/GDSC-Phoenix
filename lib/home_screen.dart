import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      child: const Center(
        child: Text(
            'Welcome to your Digital Journal!',
            textScaleFactor: 1.75
        ),
      ),
    );
  }
}

class Entries extends StatelessWidget {
  const Entries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
            'View past entries here',
            textScaleFactor: 1.75
        )
    );
  }
}

class NewEntry extends StatelessWidget {
  const NewEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
          'Make a new Entry here',
          textScaleFactor: 1.75
      ),
    );
  }
}


class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
          'Welcome to settings',
          textScaleFactor: 1.75
      ),
    );
  }
}
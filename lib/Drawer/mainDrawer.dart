import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: GestureDetector(
              child: Text("Highline Tools"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),
          ListTile(
            title: const Text('Webbing Library'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/webbingLibrary');
            },
          ),
        ],
      ),
    );
  }
}

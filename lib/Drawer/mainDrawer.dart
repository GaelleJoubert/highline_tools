import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              child: Text("Highline Tools", style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Theme.of(context).colorScheme.inversePrimary)),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ),

          ListTile(
            leading: Icon(Icons.list, color: Theme.of(context).colorScheme.primary,),
            title: const Text('Webbing library', style: TextStyle(fontSize: 16),),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/webbingLibrary');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.personFalling, color: Theme.of(context).colorScheme.primary,),
            title: const Text('Leashfall Calculator', style: TextStyle(fontSize: 16),),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/leashfallCalculator');
            },
          ),
        ],
      ),
    );
  }
}

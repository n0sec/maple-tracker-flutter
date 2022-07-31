import 'package:flutter/material.dart';

import 'divider_with_subheader.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Summary'),
            onTap: () => {
              // If the current route is '/' (Home)
              // Just close the drawer
              if (ModalRoute.of(context)!.settings.name == '/home')
                {
                  Navigator.pop(context),
                }
              // Else, push '/' to the routes as a replacement
              else
                {
                  Navigator.pushReplacementNamed(context, '/home'),
                }
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add),
            title: const Text('Character Select'),
            onTap: () =>
                Navigator.popAndPushNamed(context, '/character-select'),
          ),
          const DividerWithSubheader(subheaderText: 'Dailies'),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('Bosses'),
            onTap: () => Navigator.popAndPushNamed(context, '/daily-bosses'),
          ),
          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text('Tasks'),
            onTap: () => Navigator.popAndPushNamed(context, '/daily-tasks'),
          ),
          ListTile(
            leading: const Icon(Icons.access_alarms_rounded),
            title: const Text('Arcane River'),
            onTap: () =>
                Navigator.popAndPushNamed(context, '/daily-arcane-river'),
          ),
          const DividerWithSubheader(subheaderText: 'Weeklies'),
          ListTile(
            leading: const Icon(Icons.adb),
            title: const Text('Bosses'),
            onTap: () => Navigator.popAndPushNamed(context, '/weekly-bosses'),
          ),
          ListTile(
            leading: const Icon(Icons.ac_unit),
            title: const Text('Tasks'),
            onTap: () => Navigator.popAndPushNamed(context, '/weekly-tasks'),
          ),
        ],
      ),
    );
  }
}

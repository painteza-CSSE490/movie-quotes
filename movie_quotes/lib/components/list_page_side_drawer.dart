import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_quotes/managers/auth_manager.dart';

class ListPageSideDrawer extends StatelessWidget {
  final Function() showAllCallback;
  final Function() showOnlyMineCallback;
  const ListPageSideDrawer({
    super.key,
    required this.showAllCallback,
    required this.showOnlyMineCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Movie Quotes',
                textScaleFactor: 2,
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.white)),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('Show only my quotes'),
            onTap: () {
              // Update the state of the app.
              // ...
              showOnlyMineCallback();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: const Text('Show all qutoes'),
            onTap: () {
              // Update the state of the app.
              // ...
              showAllCallback();
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Update the state of the app.
              // ...
              AuthManager.instance.signOut();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

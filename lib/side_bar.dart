import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Sidebar extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 3, 36, 47),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            child: Text(
              'Settings',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: const Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
// Navigate to profile page or perform desired action
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.history,
              color: Colors.white,
            ),
            title: const Text(
              'History',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
// Navigate to settings page or perform desired action
            },
          ),
// Add more options as needed
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
// Navigate to settings page or perform desired action
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
// Navigate to profile page or perform desired action
            },
          ),
        ],
      ),
    );
  }
}

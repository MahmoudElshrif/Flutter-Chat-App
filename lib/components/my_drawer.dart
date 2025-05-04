import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/drawer_tile.dart';
import 'package:chatapp/pages/Home.dart';
import 'package:chatapp/pages/Settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [topButtons(context), bottomButtons(context)],
        ),
      ),
    );
  }

  Padding bottomButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: DrawerTile(
        icon: Icons.logout,
        text: "Log out",
        onTap: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
          AuthService auth = new AuthService();
          auth.signout();
        },
      ),
    );
  }

  Column topButtons(BuildContext context) {
    return Column(
      children: [
        header(context),

        //Profile
        Column(
          children: [
            DrawerTile(
              icon: Icons.home,
              text: "Home",
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            DrawerTile(
              icon: Icons.settings,
              text: "Settings",
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
          ],
        ),
      ],
    );
  }

  DrawerHeader header(context) {
    return DrawerHeader(
      child: Column(
        children: [
          SizedBox(height: 20),
          Icon(
            Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 10),
          Text(
            "Please Don't leave :)",
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

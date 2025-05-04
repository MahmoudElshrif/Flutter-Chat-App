import 'package:chatapp/auth/auth_service.dart';
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
          children: [
            Column(
              children: [
                header(context),

                //Profile
                Column(
                  children: [
                    tile(
                      Icons.home,
                      "Home",
                      context,
                      onTap: () {
                        Navigator.of(
                          context,
                        ).popUntil((route) => route.isFirst);
                      },
                    ),
                    tile(
                      Icons.settings,
                      "Settings",
                      context,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SettingsPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: tile(
                Icons.logout,
                "Log out",
                context,
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  AuthService auth = new AuthService();
                  auth.signout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tile(icon, text, context, {required Function onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: ListTile(
        leading: Icon(
          icon,
          size: 30,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(text),
        titleAlignment: ListTileTitleAlignment.center,
        horizontalTitleGap: 20,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
        onTap: () {
          Navigator.of(context).pop();
          onTap();
        },
      ),
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

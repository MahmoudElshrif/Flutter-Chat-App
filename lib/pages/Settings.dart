import 'package:chatapp/components/my_drawer.dart';
import 'package:flutter/material.dart'; // Update the path to your MyDrawer file

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      drawer: MyDrawer(), // Add the MyDrawer widget here
      body: Center(child: Text('Settings Page')),
    );
  }
}

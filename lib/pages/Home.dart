import 'package:chatapp/auth/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOMEPAGE"),
        actions: [IconButton(onPressed: signout, icon: Icon(Icons.logout))],
      ),
    );
  }

  void signout() async {
    final auth = AuthService();
    await auth.signout();
  }
}

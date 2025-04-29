import "package:chatapp/components/TextField.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var _emController = TextEditingController();
    var _pwController = TextEditingController();
    var theme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: theme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message, size: 60, color: theme.primary),
            Text(
              "WELL WELL LOOK WHO WE HAVE HERE >:(",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 30),
            MyTextfield(hintText: "Email"),
            SizedBox(height: 10),
            MyTextfield(hintText: "password", ispassword: true),
          ],
        ),
      ),
    );

    throw UnimplementedError();
  }
}

import "package:chatapp/components/TextField.dart";
import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  final TextEditingController _emController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            MyTextfield(hintText: "Email", controller: _emController),
            SizedBox(height: 10),
            MyTextfield(
              hintText: "password",
              controller: _pwController,
              ispassword: true,
            ),
          ],
        ),
      ),
    );

    throw UnimplementedError();
  }
}

import "package:chatapp/services/auth_service.dart";
import "package:chatapp/components/my_button.dart";
import "package:chatapp/components/my_textfield.dart";
import "package:chatapp/pages/Login.dart";
import "package:flutter/material.dart";

class RegisterPage extends StatelessWidget {
  final TextEditingController _emController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _pwconfirmController = TextEditingController();
  RegisterPage({super.key});

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
              "Wait a minute, who are you?",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 30),
            MyTextfield(hintText: "Email", controller: _emController),

            SizedBox(height: 10),
            MyTextfield(hintText: "Username", controller: _nameController),

            SizedBox(height: 10),
            MyTextfield(
              hintText: "Password",
              controller: _pwController,
              ispassword: true,
            ),
            SizedBox(height: 10),
            MyTextfield(
              hintText: "Confirm your password",
              controller: _pwconfirmController,
              ispassword: true,
            ),

            SizedBox(height: 20),
            MyButton(text: "Register", onTap: () => Register(context)),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                GestureDetector(
                  onTap: () {
                    onLoginTap(context);
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void Register(context) async {
    final auth = AuthService();
    if (_pwController.text != _pwconfirmController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords don't match")));
      return;
    }
    try {
      await auth.signup(
        _emController.text,
        _pwController.text,
        _nameController.text,
      );
      
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error Registering")));
    }
  }

  void onLoginTap(context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}

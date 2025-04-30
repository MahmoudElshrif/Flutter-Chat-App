import "package:chatapp/auth/auth_service.dart";
import "package:chatapp/components/my_button.dart";
import "package:chatapp/components/my_textfield.dart";
import "package:chatapp/pages/Register.dart";
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
              "YOU CAME BACK :O????",
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            SizedBox(height: 30),
            MyTextfield(hintText: "Email", controller: _emController),

            SizedBox(height: 10),
            MyTextfield(
              hintText: "password",
              controller: _pwController,
              ispassword: true,
            ),

            SizedBox(height: 20),
            MyButton(text: "Login", onTap: () => Login(context)),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("don't have an accout? "),
                GestureDetector(
                  onTap: () {
                    onRegisterTap(context);
                  },
                  child: Text(
                    "Register now",
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

  void Login(context) async {
    final auth = AuthService();

    try {
      final credit = await auth.signinwithemailandpassword(
        _emController.text,
        _pwController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("error Loginginging ingin")));
    }
  }

  void onRegisterTap(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }
}

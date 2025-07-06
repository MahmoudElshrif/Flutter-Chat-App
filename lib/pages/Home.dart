import 'package:chatapp/components/user_tile.dart';
import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/components/my_drawer.dart';
import 'package:chatapp/services/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOMEPAGE")),
      drawer: MyDrawer(),
      body: buildUserList(),
    );
  }

  Widget buildUserList() {
    final chats = ChatService();
    return StreamBuilder(
      stream: chats.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          Text("Loading...");
        }
        if (!snapshot.hasData) {
          return Text(
            "No Users",
            style: TextStyle(color: Theme.of(context).primaryColor),
          );
        }
        return ListView(
          children:
              snapshot.data!
                  .map<Widget>(
                    (userData) => buildUserListItem(userData, context),
                  )
                  .toList(),
        );
      },
    );
  }

  Widget buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    AuthService _auth = AuthService();
    if (userData["email"] != _auth.getCurrentUser()!.email) {
      return UserTile(userInfo: userData);
    } else {
      return Container();
    }
  }
}

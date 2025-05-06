import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final Map<String, dynamic> userInfo;

  const UserTile({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(userInfo['avatarUrl'] ?? ''),
          radius: 25,
        ),
        title: Text(
          userInfo['name'] ?? userInfo['email'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(userInfo['email'] ?? 'No Email Provided'),
      ),
    );
  }
}

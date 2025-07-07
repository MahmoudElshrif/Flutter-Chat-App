import 'package:chatapp/services/auth_service.dart';
import 'package:chatapp/services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];
  final Map<String, dynamic> userData;
  ChatPage({Key? key, required this.userData});
  static void open(BuildContext context, Map<String, dynamic> _userData) {
    final String email = _userData["email"];
    if (ModalRoute.of(context)?.settings.name != "chat") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ChatPage(userData: _userData),
          settings: const RouteSettings(name: "chat"),
        ),
      );
    }
  }
}

class _ChatPageState extends State<ChatPage> {
  final ChatService _chat = ChatService();
  final AuthService _auth = AuthService();

  void _sendMessage() async {
    if (widget._messageController.text.trim().isNotEmpty) {
      _chat.sendMessage(
        widget.userData["uid"],
        widget._messageController.text.trim(),
      );
      widget._messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.userData["name"])),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: _chat.getMessages(
                _auth.getCurrentUser()!.uid!,
                widget.userData["uid"],
              ),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Error...");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading...");
                }

                return ListView(
                  children:
                      snapshot.data!.docs
                          .map((doc) => buildChatItem(doc))
                          .toList(),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget._messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(icon: Icon(Icons.send), onPressed: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChatItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    bool fromMe = data["senderID"] == _auth.getCurrentUser()!.uid;
    String time =
        data["timestamp"].toDate().hour.toString() +
        ":" +
        data["timestamp"].toDate().minute.toString();

    return ListTile(
      title: Text(data["message"]),
      subtitle: Text(time),
      tileColor: fromMe ? Colors.green : Colors.grey,
    );
  }
}

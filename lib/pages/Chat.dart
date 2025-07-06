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
  void _sendMessage() {
    if (widget._messageController.text.trim().isNotEmpty) {
      setState(() {
        widget._messages.add(widget._messageController.text.trim());
      });
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
            child: ListView.builder(
              itemCount: widget._messages.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(widget._messages[index]));
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
}

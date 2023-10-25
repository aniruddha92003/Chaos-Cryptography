import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatListScreen(),
    );
  }
}

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Group Chat'),
      ),
      body: ListView(
        children: [
          ChatListItem(personName: 'Person 1'),
          ChatListItem(personName: 'Person 2'),
          ChatListItem(personName: 'Person 3'),
          ChatListItem(personName: 'Person 4'),
          ChatListItem(personName: 'Person 5'),
          ChatListItem(personName: 'Person 6'),
        ],
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String personName;

  ChatListItem({required this.personName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(personName[0]),
        ),
        title: Text(personName),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(personName: personName),
            ),
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String personName;

  ChatScreen({required this.personName});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<String> messages = [];

  void _sendMessage(String message) {
    setState(() {
      messages.add(message);
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.personName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Card(
                    margin: EdgeInsets.all(8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(messages[index]),
                    ),
                  ),
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
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: 'Type a message',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

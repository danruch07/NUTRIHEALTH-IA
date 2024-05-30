import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  // Lista de mensajes para cada usuario
  final Map<String, List<String>> _chats = {
    'Dra. Weeber': ['Hola, ¿cómo estás?'],
    'Dr. good': ['¡Hola! Estoy bien, ¿y tú?'],
    'Dr. Huitron': ['¿Qué tal tu día?']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Privado',
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          final user = _chats.keys.toList()[index];
          final messages = _chats[user];
          return _buildChat(context, user, messages);
        },
      ),
    );
  }

  Widget _buildChat(BuildContext context, String user, List<String>? messages) {
    return ListTile(
      title: Text(
        user,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(messages!.last),
      leading: CircleAvatar(
        child: Text(
          user[0],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      onTap: () {
        _openChatDetails(context, user, messages);
      },
    );
  }

  void _openChatDetails(BuildContext context, String user, List<String>? messages) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailsScreen(user: user, messages: messages ?? []),
      ),
    );
  }
}

class ChatDetailsScreen extends StatelessWidget {
  final String user;
  final List<String> messages;

  ChatDetailsScreen({required this.user, this.messages = const []});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user,
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(messages[index]);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(String text) {
    return ListTile(
      title: Text(text),
      trailing: CircleAvatar(
        child: Text(
          user[0],
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {},
            child: Text('Enviar'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

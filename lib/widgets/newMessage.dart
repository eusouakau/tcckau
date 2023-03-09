import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key});

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  String _enteredMessage = '';

  Future<void> _sendMessage() async {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Expanded(
          child: TextField(
            autocorrect: true,
            textCapitalization: TextCapitalization.sentences,
            controller: _controller,
            decoration: const InputDecoration(
              labelText: ' Digite sua mensagem aqui... ',
            ),
            onChanged: (value) {
              setState(() {
                _enteredMessage = value;
              });
            },
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
        ),
      ],
    );
  }
}

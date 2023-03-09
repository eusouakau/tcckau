import 'package:tcckau/widgets/messages.dart';
import 'package:tcckau/widgets/newMessage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pense&Responda'),
        actions: <Widget>[
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryColor,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 8),
                      Text('Sair'),
                    ],
                  ),
                )
              ],
              onChanged: (item) {
                if (item == 'logout') {
                  
                }
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(child: Messages()),
            NewMessage(), 
          ],
        ),
      ),
      backgroundColor: const Color(0x004e4e4e),
    );
  }
}

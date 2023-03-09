// ignore: file_names
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  @override
  // ignore: overridden_fields
  final Key key;
  final String userName;
  final String userImage;
  final String message;
  final bool belongsToMe;

  const MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.belongsToMe, {
    required this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration( 
                color: belongsToMe
                    ? Colors.grey[300]
                    : Theme.of(context).focusColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft:
                      belongsToMe ? const Radius.circular(12) : const Radius.circular(0),
                  bottomRight:
                      belongsToMe ? const Radius.circular(0) : const Radius.circular(12),
                ),
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: belongsToMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                      // belongsToMe
                      //     ? Colors.black
                      //     : Theme.of(context).appBarTheme,
                    ),
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      color: Colors.black
                      // belongsToMe
                      //     ? Colors.black
                      //     : Theme.of(context).appBarTheme,
                    ),
                    textAlign: belongsToMe ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: belongsToMe ? null : 128,
          right: belongsToMe ? 128 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
    );
  }
}
  
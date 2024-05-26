import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String senderName;
  final String senderAvatar;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.isMe,
    required this.senderName,
    required this.senderAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isMe)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  senderName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(221, 255, 255, 255),
                  ),
                ),
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: isMe
                  ? MainAxisAlignment.end
                  : MainAxisAlignment
                      .start, // Điều chỉnh vị trí của các thành phần bên trong
              children: [
                if (!isMe)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: CircleAvatar(
                      radius: 14,
                      backgroundImage: NetworkImage(senderAvatar),
                    ),
                  ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blue : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft:
                            isMe ? Radius.circular(12) : Radius.circular(0),
                        bottomRight:
                            isMe ? Radius.circular(0) : Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message,
                      style:
                          TextStyle(color: isMe ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

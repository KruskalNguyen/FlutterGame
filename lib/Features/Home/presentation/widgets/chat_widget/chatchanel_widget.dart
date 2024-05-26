import 'package:flutter/material.dart';

class ChatChannelWidget extends StatelessWidget {
  const ChatChannelWidget(
      {super.key, required this.Name, required this.colorBot});

  final String Name;
  final Color colorBot;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 100,
        height: 30,
        child: DecoratedBox(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              Name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: colorBot))),
        ),
      ),
    );
  }
}

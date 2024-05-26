import 'package:flutter/material.dart';

class NavChat extends StatelessWidget {
  const NavChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.blue),
      ),
    );
  }
}

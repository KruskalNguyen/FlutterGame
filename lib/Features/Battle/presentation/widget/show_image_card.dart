import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShowImageCart extends StatelessWidget {
  ShowImageCart({super.key, required this.path});
  String path;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 150, 0),
          child: Image.asset(
            path,
            width: 80,
          ),
        ),
      ),
    );
  }
}

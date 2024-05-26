import 'dart:ui';

import 'package:flutter/material.dart';

class GachaRollWidget extends StatelessWidget {
  GachaRollWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(150, 70, 150, 70),
        child: SizedBox(
            height: 100,
            width: 200,
            child: ClipRect(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black38)),
            ))));
  }
}

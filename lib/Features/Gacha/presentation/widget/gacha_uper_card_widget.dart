import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GachaUperCardWidget extends StatelessWidget {
  GachaUperCardWidget(
      {super.key,
      required this.contentImage,
      required this.frameImage,
      required this.wpName});

  final String contentImage;
  final String frameImage;
  final String wpName;
  @override
  Widget build(BuildContext context) {
    double heightWidget = MediaQuery.sizeOf(context).height * 0.3;
    double widthWidget = MediaQuery.sizeOf(context).width * 0.3;
    return SizedBox(
      height: heightWidget,
      width: widthWidget,
      child: Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage(frameImage),
            ),
          ),
          Positioned(
            top: heightWidget * 0.1,
            left: widthWidget * 0.2,
            child: Image(
              height: heightWidget * 0.6,
              width: widthWidget * 0.6,
              image: AssetImage(contentImage),
            ),
          ),
        ],
      ),
    );
  }
}

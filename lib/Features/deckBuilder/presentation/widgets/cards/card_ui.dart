import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardUI extends StatelessWidget {
  const CardUI({
    super.key,
    this.linkImage,
    this.linkBorder,
    this.linkTemplate,
  }) : super();
  final String? linkTemplate;
  final String? linkImage;
  final String? linkBorder;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1087 / 1535,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            isAntiAlias: true,
            image: (linkImage != null && linkImage != '')
                ? AssetImage(linkBorder ?? '')
                : const AssetImage('assets/border/white_border.9.png'),
            centerSlice: const Rect.fromLTRB(22, 22, 23, 23),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                top: (MediaQuery.of(context).size.width * 0.01),
                bottom: (MediaQuery.of(context).size.width * 0.01),
                left: (MediaQuery.of(context).size.width * 0.01),
                right: (MediaQuery.of(context).size.width * 0.01)),
            child: Container(
              decoration: (linkImage != null && linkImage != '')
                  ? BoxDecoration(
                      image: DecorationImage(
                        isAntiAlias: true,
                        image: AssetImage(linkImage ?? ''),
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : null,
              child: (linkTemplate != null && linkTemplate != '')
                  ? Image(
                      isAntiAlias: true,
                      image: AssetImage(linkTemplate!),
                      fit: BoxFit.fill,
                    )
                  : const Icon(
                      Icons.add_circle_outline,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

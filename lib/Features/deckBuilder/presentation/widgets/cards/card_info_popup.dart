import 'package:flutter/material.dart';

class CardInfoPopUp extends StatelessWidget {
  const CardInfoPopUp(
      {super.key,
      required this.linkImage,
      this.linkBorder,
      this.linkTemplate,
      this.cardDecription,
      this.cardName,
      this.rarity,
      this.cost});

  final String? linkTemplate;
  final String linkImage;
  final String? linkBorder;
  final String? cardDecription;
  final String? cardName;
  final String? rarity;
  final String? cost;
  @override
  Widget build(BuildContext context) {
    double heightContent = MediaQuery.of(context).size.height;
    double widthContent = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        height: heightContent * 0.8,
        width: widthContent * 0.8,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              height: heightContent,
              width: (heightContent * 0.8) * (1087 / 1535),
              isAntiAlias: true,
              image: AssetImage(linkImage),
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(left: (heightContent * 0.01)),
              child: Container(
                  height: heightContent,
                  width: widthContent * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      isAntiAlias: true,
                      image: (linkImage != '')
                          ? AssetImage(linkBorder ?? '')
                          : const AssetImage(
                              'assets/border/white_border.9.png'),
                      centerSlice: const Rect.fromLTRB(22, 22, 23, 23),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: heightContent * 0.03,
                            bottom: heightContent * 0.03),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              text: cardName,
                              style: TextStyle(
                                  fontSize: heightContent * 0.06,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' ($rarity)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: rarity == 'Epic'
                                            ? Colors.purpleAccent
                                            : Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: heightContent * 0.03,
                            right: heightContent * 0.03),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.blueGrey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Decription',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  text: 'Cost: ',
                                  style: TextStyle(
                                      fontSize: heightContent * 0.05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '$cost',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: heightContent * 0.03,
                              right: heightContent * 0.03),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              cardDecription ?? '',
                              style: TextStyle(
                                  fontSize: widthContent * 0.04,
                                  color: Colors.white),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

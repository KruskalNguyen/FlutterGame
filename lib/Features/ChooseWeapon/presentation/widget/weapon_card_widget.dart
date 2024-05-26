import 'package:drainblood/Features/ChooseWeapon/presentation/widget/upper_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeaponCardWidget extends StatelessWidget {
  const WeaponCardWidget(
      {super.key,
      required this.frameImage,
      required this.contentImage,
      required this.wpName,
      required this.wpDscription});

  final String frameImage;
  final String contentImage;
  final String wpName;
  final String wpDscription;

  @override
  Widget build(BuildContext context) {
    double heightWidget = MediaQuery.sizeOf(context).height * 0.7;
    double widthWidget = MediaQuery.sizeOf(context).width * 0.3;
    return SizedBox(
      height: heightWidget,
      width: widthWidget * 0.7,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage("assets/choosewp/rectangle.png"),
            height: heightWidget,
            width: widthWidget,
          ),
          Positioned(
            top: heightWidget * 0.04,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UpperCardWidget(
                    contentImage: contentImage,
                    frameImage: frameImage,
                    wpName: wpName),
                SizedBox(
                  width: widthWidget * 0.3,
                  height: heightWidget * 0.3,
                  child: Text(
                    wpDscription,
                    style: const TextStyle(
                        fontSize: 5.2,
                        color: Colors.white,
                        overflow: TextOverflow.clip),
                  ),
                ),
                SizedBox(
                  height: heightWidget * 0.01,
                ),
                ElevatedButton(
                  onPressed: () => {},
                  child: Text(
                    'Choose',
                    style: TextStyle(color: Colors.black, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

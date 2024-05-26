import 'package:drainblood/Features/Gacha/presentation/widget/gacha_card_widget.dart';
import 'package:flutter/material.dart';

class GachaPage extends StatefulWidget {
  GachaPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChoooseWeaponState();
}

class _ChoooseWeaponState extends State<GachaPage> {
  @override
  Widget build(BuildContext context) {
    double heightWidget = MediaQuery.sizeOf(context).height;
    double widthWidget = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Image(
            image: AssetImage("assets/images/button/back-icon.png"),
            height: kToolbarHeight * 0.8,
            width: kToolbarHeight * 0.8,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/choosewp/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GachaCardWidget(
                  frameImage: "assets/choosewp/card_rarity.png",
                  contentImage: "assets/choosewp/knight.png",
                  wpName: "Knight",
                  wpDscription:
                      "Knight is a master of swords and a believer of physical strikes. They are willing to sacrifice themselves for the final success."),
              GachaCardWidget(
                  frameImage: "assets/choosewp/card_rarity.png",
                  contentImage: "assets/choosewp/knight.png",
                  wpName: "Knight",
                  wpDscription:
                      "Knight is a master of swords and a believer of physical strikes. They are willing to sacrifice themselves for the final success."),
              GachaCardWidget(
                  frameImage: "assets/choosewp/card_rarity.png",
                  contentImage: "assets/choosewp/knight.png",
                  wpName: "Knight",
                  wpDscription:
                      "Knight is a master of swords and a believer of physical strikes. They are willing to sacrifice themselves for the final success."),
            ],
          ),
        ),
      ),
    );
  }
}

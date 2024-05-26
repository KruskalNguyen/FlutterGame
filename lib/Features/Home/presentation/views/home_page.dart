import 'package:drainblood/Features/Battle/presentation/view/game_tiled_map_route.dart';
import 'package:drainblood/Features/ChooseWeapon/presentation/view/choose_weapon_route.dart';
import 'package:drainblood/Features/Gacha/presentation/view/gacha_page_route.dart';
import 'package:drainblood/Features/Home/presentation/widgets/chat_widget/chat_widget.dart';
import 'package:drainblood/Features/Home/presentation/widgets/navbar_widget.dart';
import 'package:drainblood/Features/Mutiplayer/presentation/view/join_or_create/join_or_create_route.dart';
import 'package:drainblood/Features/Mutiplayer/presentation/view/lobby/muti_player_route.dart';
import 'package:drainblood/Features/Profile/presentation/views/profile_page_route.dart';
import 'package:drainblood/features/deckBuilder/presentation/views/deck_builder_route.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String displayName;

  const HomePage({super.key, required this.displayName});

  @override
  State<HomePage> createState() => _HomePagState();
}

class _HomePagState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/homepage/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.topLeft,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.black.withOpacity(0))),
                  onPressed: () {
                    Navigator.pushNamed(context, ProfilePageRoute.routeName);
                  },
                  child: Text(
                    widget.displayName,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topRight,
              child: Image(image: AssetImage("assets/homepage/slice43 1.png")),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElementNav(
                    name: 'Card',
                    image: 'assets/homepage/slice43 1.png',
                    route: DeckBuilderRoute.routeName,
                  ),
                  ElementNav(
                    name: 'Gacha',
                    image: 'assets/homepage/slice28 1.png',
                    route: GachaPageRoute.routeName,
                  ),
                  ElementNav(
                    name: 'Weapon',
                    image: 'assets/homepage/slice28 1.png',
                    route: ChooseWeaponRoute.routeName,
                  ),
                  ElementNav(
                    name: 'Battle',
                    image: 'assets/homepage/slice28 1.png',
                    route: GameTiledMapRoute.routeName,
                  ),
                  ElementNav(
                    name: 'Online',
                    image: 'assets/homepage/slice28 1.png',
                    route: JoinOrCreateRoute.routeName,
                  ),
                ],
              ),
            ),
          ),
          ChatWidget(),
        ],
      ),
    ));
  }
}

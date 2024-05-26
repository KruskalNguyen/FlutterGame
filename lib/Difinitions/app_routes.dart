import 'package:drainblood/Features/Battle/presentation/view/game_tiled_map_route.dart';
import 'package:drainblood/Features/Battle/presentation/view/island_map/island_map_route.dart';
import 'package:drainblood/Features/Battle/presentation/view/simple_player_route.dart';
import 'package:drainblood/Features/ChooseWeapon/presentation/view/choose_weapon_route.dart';
import 'package:drainblood/Features/Gacha/presentation/view/gacha_page_route.dart';
import 'package:drainblood/Features/Home/presentation/views/home_page_route.dart';
import 'package:drainblood/Features/Login/presentation/View/login_page_route.dart';
import 'package:drainblood/Features/Mutiplayer/presentation/view/join_or_create/join_or_create_route.dart';
import 'package:drainblood/Features/Mutiplayer/presentation/view/lobby/muti_player_route.dart';
import 'package:drainblood/Features/Profile/presentation/views/profile_page_route.dart';
import 'package:drainblood/Features/deckBuilder/presentation/views/deck_builder_route.dart';
import 'package:flutter/widgets.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
        ...HomePageRoute.builder,
        ...LoginPageRoute.builder,
        ...SimplePlayerRoute.builder,
        ...ChooseWeaponRoute.builder,
        ...GameTiledMapRoute.builder,
        ...GachaPageRoute.builder,
        ...ProfilePageRoute.builder,
        ...IslandMapRoute.builder,
        ...DeckBuilderRoute.builder,
        ...MutiPlayerRoute.builder,
        ...JoinOrCreateRoute.builder
      };
}
